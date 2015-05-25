class SittersController < ApplicationController
  respond_to :json, :html

  def index
    if params[:location].empty?
      flash[:notice] = "Please set a location"
      redirect_to root_path
    else
      @coordinates = Location.new.coordinates_for(params[:location])
      @sitters = User.where(
          sitter: true
        ).near(
          @coordinates, 50
        ).page(
          params[:page]
        ).per(
          10
        )

      respond_to do |format|
        format.html
        format.json { render json: { location: @coordinates, sitter: @sitters } }
      end
    end
  end

  def show
    @review = Review.new
    @image_upload = Image.new
    @sitter = User.find(params[:id])
    @reviews = @sitter.reviews_received
    @images = @sitter.image_uploads

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
end
