class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /feeds
  # GET /feeds.json
  def index
    respond_to do |format|
      format.html {
        query = params[:q].presence || "*"
        @feeds = Feed.search(query)
      }
      format.csv { 
        send_data Feed.to_csv
      }
    end
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    @categories = Category.where(id: @feed.category_ids)
  end

  # GET /feeds/new
  def new
    if params[:category]
      begin 
        @categories = Category.find(params[:category]).subtree
      rescue
        @categories = nil
      end
    end
    @categories ||= Category.all
    @feed = Feed.new
  end

  # GET /feeds/1/edit
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

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Feed.import(params[:file])
    redirect_to feeds_url, notice: "Feeds imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feed_params
      params.require(:feed).permit(:name, :url, :auto_public, :primary_role, :email_descript, :firm_name, :tag_list,  :follow_url, :description, :default_author, :address, category_ids:[])
    end
end

