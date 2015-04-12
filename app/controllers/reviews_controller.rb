class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @sitter = User.find(params[:user_id])
    @review = @siter.reviews.find(params[:id])
  end

  def create
    @sitter = User.find(params[:sitter_id])
    @review = Review.new(review_params)
    @user_review = UserReview.new(review: @review, user: current_user)
    @sitter_review = UserReview.new(review: @review, user: @sitter)

    if (@review.save && @user_review.save && @sitter_review.save)
      flash[:notice] = "Review added successfully."
      redirect_to sitter_path(@sitter)
    else
      @errors = @review.errors.full_messages
      render "sitters/show"
    end
  end

  protected

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
