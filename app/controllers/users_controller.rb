class UsersController < ApplicationController
  def index
    @user = User.where(sitter: true)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create

  end

  def update
  end

  def destroy
  end
end
