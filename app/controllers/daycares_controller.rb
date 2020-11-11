class DaycaresController < ApplicationController
  before_action :set_daycare, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /daycares
  # GET /daycares.json
  def index
    if(!params.has_key?(:location) || params.has_key?(:location) == nil || params[:location] == "")
      @daycares = Daycare.all.paginate(:page => params[:page], :per_page => 30)

    else
      @daycares = Daycare.near(params[:location], 50).all.paginate(:page => params[:page], :per_page => 30)
    end
  end

  # GET /daycares/1
  # GET /daycares/1.json
  def show
  end

  # GET /daycares/new
  def new
    @daycare = Daycare.new
  end

  # GET /daycares/1/edit
  def edit
  end

  # POST /daycares
  # POST /daycares.json
  def create
    @daycare = Daycare.new(daycare_params)

    respond_to do |format|
      if @daycare.save
        format.html { redirect_to @daycare, notice: 'Daycare was successfully created.' }
        format.json { render :show, status: :created, location: @daycare }
      else
        format.html { render :new }
        format.json { render json: @daycare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daycares/1
  # PATCH/PUT /daycares/1.json
  def update
    respond_to do |format|
      if @daycare.update(daycare_params)
        format.html { redirect_to @daycare, notice: 'Daycare was successfully updated.' }
        format.json { render :show, status: :ok, location: @daycare }
      else
        format.html { render :edit }
        format.json { render json: @daycare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daycares/1
  # DELETE /daycares/1.json
  def destroy
    @daycare.destroy
    respond_to do |format|
      format.html { redirect_to daycares_url, notice: 'Daycare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daycare
      @daycare = Daycare.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daycare_params
      params.require(:daycare).permit(:name, :address, :url, :call_phone, :text_phone, :email, :center_description, :additional_info, :yelp_url, :hours_open, :days_open, :ages, :center_type, :center_tuition, :care_type, :accreditation_type, :religious_affiliations, :languages_spoken, :spots_available, :availability_information, :rating_score, :rating_count, :student_teacher_ratio, :added_tags, :user_owner, :contact_name, :contact_position, :contact_personal_num, :daycare_license_number, :center_district, :center_fax, :latitude, :longitude, :location)
    end
end
