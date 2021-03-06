class MobileAppsController < ApplicationController
  before_action :set_mobile_app, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /mobile_apps
  # GET /mobile_apps.json
  def index
    @mobile_apps = MobileApp.all
  end

  # GET /mobile_apps/1
  # GET /mobile_apps/1.json
  def show
    @categories = Category.where(id: @mobile_app.category_ids)
  end

  # GET /mobile_apps/new
  def new
    if params[:category]
      begin 
        @categories = Category.find(params[:category]).subtree
      rescue
        @categories = nil
      end
    end
    @categories ||= Category.all
    @mobile_app = MobileApp.new
  end

  # GET /mobile_apps/1/edit
  def edit
    if params[:category]
      begin 
        @categories = Category.find(params[:category]).subtree
      rescue
        @categories = nil
      end
    end
    @categories ||= Category.all
  end

  # POST /mobile_apps
  # POST /mobile_apps.json
  def create
    @mobile_app = MobileApp.new(mobile_app_params)

    respond_to do |format|
      if @mobile_app.save
        format.html { redirect_to @mobile_app, notice: 'Mobile app was successfully created.' }
        format.json { render :show, status: :created, location: @mobile_app }
      else
        format.html { render :new }
        format.json { render json: @mobile_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mobile_apps/1
  # PATCH/PUT /mobile_apps/1.json
  def update
    respond_to do |format|
      if @mobile_app.update(mobile_app_params)
        format.html { redirect_to @mobile_app, notice: 'Mobile app was successfully updated.' }
        format.json { render :show, status: :ok, location: @mobile_app }
      else
        format.html { render :edit }
        format.json { render json: @mobile_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobile_apps/1
  # DELETE /mobile_apps/1.json
  def destroy
    @mobile_app.destroy
    respond_to do |format|
      format.html { redirect_to mobile_apps_url, notice: 'Mobile app was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mobile_app
      @mobile_app = MobileApp.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mobile_app_params
      params.require(:mobile_app).permit(:name, :slug, :ios_link, :android_link, :ios_sensortower_link, :android_sensortower_link, :company_id, category_ids:[])
    end
end
