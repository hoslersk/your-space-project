class VenuesController < ApplicationController
before_action :authorize, except: [:show, :index]
before_action :set_venue, only: [:show, :edit, :update, :destroy]

@@venues_for_maps = []
  def new
    @venue = Venue.new
    3.times do
      @venue.images.build
    end
  end

  def create
    @venue = Venue.create(venue_params)
    # @venue.host_id=(current_user.id)
    # @venue.save
    if @venue.errors.any?
      redirect_to venue_path(@venue), notice: @venue.errors.full_messages.join(". ")
    else
      redirect_to venue_path(@venue)
    end
  end

  def show
  end

  def index

    # if the request is coming from a 'search' page, set params equal to respective attributes
    if params[:commit] == "Search"
      @zip_code = params[:zip_code]
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      flash[:notice] = ""
      # if search submission attributes are nil, return error and load all venues
      if @zip_code == nil || @start_date == nil || @end_date == nil
        flash[:notice] << "Search fields cannot be blank"
        @venues = Venue.all
      # else if search dates sensible, return error and load all venues
      elsif @start_date > @end_date
        flash[:notice] << "Start date cannot be before end date"
        @venues = Venue.all
      # else run the Active Record query
      else
        @venues = Venue.joins(:listings).where("available_start_date <= ? AND available_end_date >= ? AND price >= ? AND price <= ?", params[:start_date], params[:end_date], params[:price_min_input], params[:price_max_input])
      end
    # if the request is not coming from the search page, load all venues
    else
      @venues = Venue.all
    end
    respond_to do |format|
      format.js
      # render HTML if not a ajax request
      format.html

    end
    @@venues_for_maps = @venues
  end
  # redirect_to root_path


  def edit
  end

  def update
    @venue.update(venue_params)
    if @venue.errors.any?
      redirect_to venue_path(@venue), notice: @venue.errors.full_messages.join(". ")
    else
      redirect_to venue_path(@venue)
    end
  end

  def destroy
    @venue.listings.each do |lis|
      lis.reservations.each do |res|
        res.destroy
      end
      lis.destroy
    end
    @venue.destroy
    redirect_to venues_path
  end

  def get_venues_for_map
    @venues = Venue.all
    respond_to do |format|
      format.json {render json: {venues: @venues, searchInput: params[:searchInput]}}
    end
  end

  def my_venues
    @venues = current_user.host_venues

  end


 private

 def set_venue
   @venue = Venue.find(params[:id])
 end

 def venue_params
   params.require(:venue).permit(:name, :address, :description, :host_id, :zip_code, :city, images_attributes: [:id, :image, :description, :venue_id])
 end




end
