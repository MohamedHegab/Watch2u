class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include Response
  include ExceptionHandler

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :region, :code, :mobile, :auth_token, :role_input])
  end
end
