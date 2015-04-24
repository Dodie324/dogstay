class ImagesController < ApplicationController

  def create
    if params[:image].nil?
      flash[:notice] = "You must upload an image."
      redirect_to sitter_path(current_user)
    else
      @image_upload = Image.new(image_params)
      @image_upload.user = current_user

      if @image_upload.save
        flash[:notice] = "Image added successfully."
        redirect_to sitter_path(@image_upload.user)
      else
        flash[:note] = "Image not added."
        redirect_to sitter_path(@image_upload.user)
      end
    end
  end

  private

  def image_params
    params.require(:image).permit(:image_upload)
  end
end
