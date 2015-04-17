class SittersController < ApplicationController
  def index
    if params[:address].present?
      @sitters = User.where(sitter: true, city: params[:address])
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
