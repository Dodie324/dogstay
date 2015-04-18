class SittersController < ApplicationController
  respond_to :json, :html

  def index
    @location = coordinates_for(params[:location])
    @sitters =
    if @location.present?
      @sitters = User.where(sitter: true, city: params[:location])
    else
      @sitters = User.where(sitter: true)
    end

    respond_to do |format|
      format.html
      format.json { render json: @location }
    end
  end

  def show
    @sitter = User.find(params[:id])
    @reviews = @sitter.reviews_received
    @review = Review.new
  end

  def coordinates_for(location)
    coordinates = Location.find_by(location: location)
    if coordinates
      coordinates
    else
      lat_lng = Geocoder.coordinates(location)
      Location.create!(
        location: location,
        latitude: lat_lng[0],
        longitude: lat_lng[1]
      )
    end
  end
end
