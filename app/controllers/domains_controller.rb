class DomainsController < ApplicationController
  include ApplicationHelper
  before_action :set_domain, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :autocomplete]

  # GET /domains
  # GET /domains.json
  def index
    respond_to do |format|
      args = {}
      args[:alexa_rank] = {}
      args[:alexa_rank][:gte] = params[:alexa_rank_from] if params[:alexa_rank_from].present?
      args[:alexa_rank][:lte] = params[:alexa_rank_to] if params[:alexa_rank_to].present?

      args[:alexa_90day_delta] = {}
      args[:alexa_90day_delta][:gte] = params[:alexa_90day_delta_from] if params[:alexa_90day_delta_from].present?
      args[:alexa_90day_delta][:lte] = params[:alexa_90day_delta_to] if params[:alexa_90day_delta_to].present?

      format.html {
        if params[:uncategorized]
          @domains = Domain.includes(:categories).where( :categories => {id: nil} ).order(:alexa_rank).page(params[:page]).per_page(50)
        elsif params[:tag]
          @domains = Domain.tagged_with(params[:tag]).order(:alexa_rank).page(params[:page]).per_page(50)
        end

       @count = Domain.count
       
       query = params[:q].presence || "*"

       alexa_ranges = [{to: 1000}, {from: 1000, to: 10000}, {from: 10000, to: 100000}, {from: 100000, to: 1000000}, {from: 1000000}]

       alexa_90day_delta_ranges = [{to: -100000}, {from: -100000, to: -10000}, {from: -10000, to: 0}, {from: 0, to: 10000}, {from: 10000, to: 100000}, {from: 100000, to: 1000000}, {from: 1000000}]
       @domains ||= Domain.search query, where: args, page: params[:page], per_page: 50, order: :alexa_rank, aggs: {year_founded: {}, alexa_rank: {ranges: alexa_ranges}, funds_raised: {}, alexa_90day_delta: {ranges: alexa_90day_delta_ranges}}

      }
      format.csv {
        send_data Domain.to_csv
      }
    end
  end

  # GET /domains/1
  # GET /domains/1.json
  def show
    @alexa_counts = DomainAlexa.where(domain_id: @domain.id)
    @categories = Category.where(id: @domain.category_ids)
    @locations = Location.where(id: @domain.location_ids)
    #AlexaPullJob.perform_now(@domain.domain)
    #DomainEnrichJob.set(wait: 10).perform_later(@domain.domain)
    if @domain.company_id != nil
      @company = Company.find(@domain.company_id)
      #@linkedin_counts = LinkedinCount.where(company_id: @company.id)
    end

  end

  # GET /domains/new
  def new
    if params[:category]
      begin 
        @categories = Category.find(params[:category]).subtree
      rescue
        @categories = nil
      end
    end
    @categories ||= Category.all
    @domain = Domain.new
    @locations = Location.all
  end

  # GET /domains/1/edit
  def edit
    if params[:category]
      begin 
        @categories = Category.find(params[:category]).subtree
      rescue
        @categories = nil
      end
    end
    @categories ||= Category.all
    @locations = Location.all
  end

  # POST /domains
  # POST /domains.json
  def create
    params[:domain][:domain] = sanitize_url(domain_params[:domain])
    @domain = Domain.new(domain_params)
    DomainEnrichJob.set(wait: 3).perform_later(@domain.domain)
    AlexaPullJob.set(wait: 3).perform_later(@domain.domain)
    #@domain_category = Domain_category.new(domain_params)

    respond_to do |format|
      if @domain.save
        format.html { redirect_to @domain, notice: 'Domain was successfully created.' }
        format.json { render :show, status: :created, location: @domain }
      else
        format.html { render :new }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domains/1
  # PATCH/PUT /domains/1.json
  def update
    respond_to do |format|
      if @domain.update(domain_params)
        format.html { redirect_to @domain, notice: 'Domain was successfully updated.' }
        format.json { render :show, status: :ok, location: @domain }
      else
        format.html { render :edit }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    @domain.destroy
    respond_to do |format|
      format.html { redirect_to domains_url, notice: 'Domain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autocomplete
    render json: Domain.search(params[:term], fields: [{domain: :text_start}], limit: 10).map(&:domain)
  end

  def import
    Domain.import(params[:file])
    redirect_to domains_path, notice: "Domains imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain
      @domain = Domain.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_params
      params.require(:domain).permit(:domain, :name, :description, :logo, :year_founded, :headquarters, :cover_photo, :countries, :status, :sub_category, :tag_list, :ancestry, :comm_platform, :alexa_rank, :funds_raised, :category_id, :company_id, :page_views_per_million, :reach_views_per_million, category_ids: [], location_ids: [])
    end
end
