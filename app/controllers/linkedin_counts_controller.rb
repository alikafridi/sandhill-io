class LinkedinCountsController < ApplicationController
  before_action :set_linkedin_count, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  # GET /linkedin_counts
  # GET /linkedin_counts.json
  def index
    @linkedin_counts = LinkedinCount.all
  end

  # GET /linkedin_counts/1
  # GET /linkedin_counts/1.json
  def show
    @company = Company.find(@linkedin_count.company_id)
  end

  # GET /linkedin_counts/new
  def new
    @linkedin_count = LinkedinCount.new
  end

  # GET /linkedin_counts/1/edit
  def edit
  end

  # POST /linkedin_counts
  # POST /linkedin_counts.json
  def create
    @linkedin_count = LinkedinCount.new(linkedin_count_params)

    respond_to do |format|
      if @linkedin_count.save
        format.html { redirect_to @linkedin_count, notice: 'Linkedin count was successfully created.' }
        format.json { render :show, status: :created, location: @linkedin_count }
      else
        format.html { render :new }
        format.json { render json: @linkedin_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linkedin_counts/1
  # PATCH/PUT /linkedin_counts/1.json
  def update
    respond_to do |format|
      if @linkedin_count.update(linkedin_count_params)
        format.html { redirect_to @linkedin_count, notice: 'Linkedin count was successfully updated.' }
        format.json { render :show, status: :ok, location: @linkedin_count }
      else
        format.html { render :edit }
        format.json { render json: @linkedin_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linkedin_counts/1
  # DELETE /linkedin_counts/1.json
  def destroy
    @linkedin_count.destroy
    respond_to do |format|
      format.html { redirect_to linkedin_counts_url, notice: 'Linkedin count was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    LinkedinCount.import(params[:file])
    redirect_to linkedin_counts_path, notice: "Linkedin Count imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linkedin_count
      @linkedin_count = LinkedinCount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def linkedin_count_params
      params.require(:linkedin_count).permit(:company_id, :employee_count, :date, :uid, :domain)
    end
end
