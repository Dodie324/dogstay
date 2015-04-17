class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :devise_permitted_parameters, if: :devise_controller?

  protected

  def devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [
      :first_name,
      :last_name,
      :phone_number,
      :address1,
      :address2,
      :city,
      :state,
      :zipcode,
      :headline,
      :description,
      :sitter,
      :have_dogs,
      :have_children,
      :property_type,
      :yard_type,
      :image,
      :price,
      :availability
    ]
  end

  protect_from_forgery with: :exception
end
