class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:user_username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:user_username, :email, :password, :password_confirmation, :current_password) }
  end
  
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    return dosages_path
  end

  def after_sign_out_path_for(resource)
    return new_user_session_path
  end
end