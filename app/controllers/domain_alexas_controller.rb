class DomainAlexasController < ApplicationController
  before_action :set_domain_alexa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /domain_alexas
  # GET /domain_alexas.json
  def index
    @domain_alexas = DomainAlexa.all
  end

  # GET /domain_alexas/1
  # GET /domain_alexas/1.json
  def show
    if @domain_alexa.date.nil?
      @domain_alexa.date = @domain_alexa.created_at
      @domain_alexa.save
    end
  end

  # GET /domain_alexas/new
  def new
    @domain_alexa = DomainAlexa.new
  end

  # GET /domain_alexas/1/edit
  def edit
  end

  # POST /domain_alexas
  # POST /domain_alexas.json
  def create
    @domain_alexa = DomainAlexa.new(domain_alexa_params)

    respond_to do |format|
      if @domain_alexa.save
        format.html { redirect_to @domain_alexa, notice: 'Domain alexa was successfully created.' }
        format.json { render :show, status: :created, location: @domain_alexa }
      else
        format.html { render :new }
        format.json { render json: @domain_alexa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domain_alexas/1
  # PATCH/PUT /domain_alexas/1.json
  def update
    respond_to do |format|
      if @domain_alexa.update(domain_alexa_params)
        format.html { redirect_to @domain_alexa, notice: 'Domain alexa was successfully updated.' }
        format.json { render :show, status: :ok, location: @domain_alexa }
      else
        format.html { render :edit }
        format.json { render json: @domain_alexa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domain_alexas/1
  # DELETE /domain_alexas/1.json
  def destroy
    @domain_alexa.destroy
    respond_to do |format|
      format.html { redirect_to domain_alexas_url, notice: 'Domain alexa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain_alexa
      @domain_alexa = DomainAlexa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_alexa_params
      params.require(:domain_alexa).permit(:domain_url, :alexa_rank, :reach_rank_value, :reach_per_million_value, :page_views_rank_value, :page_views_per_million_value, :page_views_per_user_value, :domain_id)
      date

    end
end
