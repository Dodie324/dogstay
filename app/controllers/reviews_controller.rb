class ReviewsController < ApplicationController
  def create
    @sitter = User.find(params[:id])
    @review = Review.new(review_params)
    # @review.rating ||= params["score"]
    @review.sitter = @sitter
    @review.user = current_user

    if @review.save
      # ReviewNotifier.new_review(@review).deliver_later
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
