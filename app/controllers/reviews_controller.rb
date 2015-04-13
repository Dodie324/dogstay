class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @sitter = User.find(params[:sitter_id])
    @review = @sitter.reviews.find(params[:id])
  end

  def create
    @sitter = User.find(params[:sitter_id])
    @review = Review.new(review_params)
    @user_review = UserReview.new(review: @review, user: current_user)
    @sitter_review = UserReview.new(review: @review, user: @sitter)

    if @review.save && @user_review.save && @sitter_review.save
      flash[:notice] = "Review added successfully."
      redirect_to sitter_path(@sitter)
    else
      render "sitters/show"
    end
  end

  def update
    @sitter = User.find(params[:sitter_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:notice] = "Review updated!"
      redirect_to sitter_path(@sitter)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @sitter = User.find(params[:sitter_id])
    if @review.users.find(current_user).present? #|| current_user.admin?
      @review.destroy
      flash[:notice] = "Review deleted."
      redirect_to sitter_path(@sitter)
    end
  end

  protected

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
