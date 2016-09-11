class VenuesController < ApplicationController
before_action :authorize, except: [:show, :index]
before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def new
    @venue = Venue.new
    3.times do
      @venue.images.build
    end
  end

  def create
    @venue = Venue.create(venue_params)
    byebug
    @venue.host_id=(current_user.id)
    @venue.save
    redirect_to venue_path(@venue)
  end

  def show
  end

  def index
    if params.length > 2
      @zip_code = params[:zip_code]
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      if @start_date > @end_date
        flash[:notice] = "Please select a valid date range"
      elsif @start_date == nil || @end_date == nil || @zip_code == nil || params[:price_min_input] == nil || params[:price_max_input] == nil
        flash[:notice] = "Search fields cannot be empty"
      else
        @venues = Venue.joins(:listings).where("available_start_date <= ? AND available_end_date >= ? AND price >= ? AND price <= ?", params[:start_date], params[:end_date], params[:price_min_input], params[:price_max_input])
      end
    else
      render 'index'
    end
  end

  def edit
  end

  def update
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
  end

  def destroy
    @venue.delete
    redirect_to venues_path
  end


 private

 def set_venue
   @venue = Venue.find(params[:id])
 end

 def venue_params
   params.require(:venue).permit(:name, :address, :description, :host_id, :zip_code, :city, images_attributes: [:image, :description])
 end

end
