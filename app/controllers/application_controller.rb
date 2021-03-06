class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include Response
  include ExceptionHandler

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render json: {message: 'Don\'t have authorization', status: :fail, code: 8000} }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :region, :code, :mobile, :auth_token, :role_input])
  end

  # def authenticate_admin_user!
  #   return nil if user_signed_in? && !(current_user.has_role? :admin)
  #   authenticate_user!
  # end
end
