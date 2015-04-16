class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :devise_permitted_parameters, if: :devise_controller?

  protected

  def devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :phone_number
    devise_parameter_sanitizer.for(:sign_up) << :address1
    devise_parameter_sanitizer.for(:sign_up) << :address2
    devise_parameter_sanitizer.for(:sign_up) << :city
    devise_parameter_sanitizer.for(:sign_up) << :state
    devise_parameter_sanitizer.for(:sign_up) << :zipcode
    devise_parameter_sanitizer.for(:sign_up) << :headline
    devise_parameter_sanitizer.for(:sign_up) << :description
    devise_parameter_sanitizer.for(:sign_up) << :sitter
    devise_parameter_sanitizer.for(:sign_up) << :have_dogs
    devise_parameter_sanitizer.for(:sign_up) << :have_children
    devise_parameter_sanitizer.for(:sign_up) << :property_type
    devise_parameter_sanitizer.for(:sign_up) << :yard_type
    devise_parameter_sanitizer.for(:sign_up) << :image
  end

  protect_from_forgery with: :exception
end
