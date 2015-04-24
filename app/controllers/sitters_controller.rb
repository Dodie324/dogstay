class SittersController < ApplicationController
  respond_to :json, :html

  def index
    if params[:location].empty?
      flash[:notice] = "Please set a location"
      redirect_to root_path
    else
      @location = coordinates_for(params[:location])
      @sitters = User.where(
          sitter: true
        ).near(
          @location, 50
        ).page(
          params[:page]
        ).per(
          10
        )

      respond_to do |format|
        format.html
        format.json { render json: { location: @location, sitter: @sitters } }
      end
    end
  end

  def show
    @sitter = User.find(params[:id])
    @reviews = @sitter.reviews_received
    @images = @sitter.image_uploads
    @review = Review.new
    @image_upload = Image.new

    respond_to do |format|
        format.html
        format.json { render json: { sitter: @sitter } }
    end
  end

  def destroy
    @sitter = User.find(params[:id])
    if @sitter.destroy
      flash[:notice] = "Sorry to see you go!"
      redirect_to root_path
    end
  end

  def coordinates_for(location)
    location = location.downcase.gsub(/\W/, "")
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
