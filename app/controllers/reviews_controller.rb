class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @sitter = User.find(params[:sitter_id])
    @review = @sitter.reviews_received.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.sitter = User.find(params[:sitter_id])

    if @review.save
      flash[:notice] = "Review added successfully."
      redirect_to sitter_path(@review.sitter)
    else
      flash[:note] = "Review not added."
      redirect_to sitter_path(@review.sitter)
    end
  end

  def update
    @sitter = User.find(params[:sitter_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      respond_to do |format|
        format.html {
          flash[:notice] = "Review updated!"
          redirect_to sitter_path(@sitter)
        }
        format.json {
          render json: @review
        }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: { errors: @review.errors.full_messages }, status: 400 }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @sitter = User.find(params[:sitter_id])

    if @review.destroy
      flash[:notice] = "Review deleted."
      redirect_to sitter_path(@sitter)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
