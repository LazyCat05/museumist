class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :devise_permitted_parameters, if: :devise_controller?
  protected

  def devise_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username,:first_name, :last_name, :email, :password, :password_confirmation, :profile_photo)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username,:first_name, :last_name, :email, :password, :password_confirmation,
        :current_password, :profile_photo)
    end
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :email] )
  # end
end
