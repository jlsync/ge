class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :destination_url, :reward_1, :reward_2, :reward_3, :threshold_1, :threshold_2, :threshold_3, :email, :password, :password_confirmation) }
	  end
end
