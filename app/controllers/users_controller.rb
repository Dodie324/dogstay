class UsersController < ApplicationController
  def index
    @users = User.where(sitter: true)
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
    binding.pry
  end

  def update
  end

  def destroy
  end
end
