class SittersController < ApplicationController
  def index
    if params[:location].present?
      @sitters = User.where(sitter: true, city: params[:location])
    else
      @sitters = User.where(sitter: true)
    end
  end

  def show
    @sitter = User.find(params[:id])
    @reviews = @sitter.reviews_received
    @review = Review.new
  end
end
