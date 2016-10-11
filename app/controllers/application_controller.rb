class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_username, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:user_username, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_username, :email, :password, :password_confirmation, :current_password])
  end
  
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    return dashboard_index_path
  end

  def after_sign_out_path_for(resource)
    flash[:error] = "Access denied!"
    return new_user_session_path
  end
end