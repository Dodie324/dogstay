class SittersController < ApplicationController
  def index
    @sitters = User.where(sitter: true)
  end

  def show
    @sitter = User.find(params[:id])
  end
end
