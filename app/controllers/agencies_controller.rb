class AgenciesController < ApplicationController
  include ApplicationHelper
  before_action :set_agency, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /agencies
  # GET /agencies.json
  def index
    @agencies = Agency.all
  end

  # GET /agencies/1
  # GET /agencies/1.json
  def show
    @categories = Category.where(id: @agency.category_ids)
  end

  # GET /agencies/new
  def new
    @categories = Category.find_by(name: "Agency")
    if !@categories.nil?
      @categories = @categories.subtree
    end
    @agency = Agency.new
  end

  # GET /agencies/1/edit
  def edit
    @categories = Category.find_by(name: "Agency")
    if !@categories.nil?
      @categories = @categories.subtree
    end
  end

  # POST /agencies
  # POST /agencies.json
  def create
    @agency = Agency.new(agency_params)
    @url = sanitize_url(@agency.domain)

    AgencyEnrichJob.set(wait: 5).perform_later(@url)

    respond_to do |format|
      if @agency.save
        format.html { redirect_to @agency, notice: 'Agency was successfully created.' }
        format.json { render :show, status: :created, location: @agency }
      else
        format.html { render :new }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    respond_to do |format|
      if @agency.update(agency_params)
        format.html { redirect_to @agency, notice: 'Agency was successfully updated.' }
        format.json { render :show, status: :ok, location: @agency }
      else
        format.html { render :edit }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    @agency.destroy
    respond_to do |format|
      format.html { redirect_to agencies_url, notice: 'Agency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency
      @agency = Agency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agency_params
      params.require(:agency).permit(:name, :image_url, :logo_url, :domain, :type, :clients, :linkedin_url, :employee_count, :description, :year_founded, :location, category_ids:[])
    end
end
