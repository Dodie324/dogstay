class ApplicationController < ActionController::Base
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

    devise_parameter_sanitizer.for(:account_update) << [
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
