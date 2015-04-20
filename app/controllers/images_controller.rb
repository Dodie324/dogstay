class ImagesController < ApplicationController

  def create
    if params[:image].nil?
      flash[:notice] = "You must upload an image."
      redirect_to sitter_path(params[:user_id])
    else
      @image = Image.new(image_params)
      @image.user = current_user

      if @image.save
        flash[:notice] = "Image added successfully."
        redirect_to sitter_path(@image.user)
      else
        flash[:note] = "Image not added."
        redirect_to sitter_path(@image.user)
      end
    end
  end

  def destroy
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
