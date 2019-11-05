class ApplicationController < ActionController::Base
	def team
    render html: "TEAM NEWBIE: A credibility checker for news articles"
  end

  def output
    render html: "Credibility Score Output"
  end

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) do |user|
    	user.permit(:user_name, :email, :password, :remember_me)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |user|
    	user.permit(:email, :password, :remember_me)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user|
    	user.permit(:name, :password, :password_confirmation, :current_password)
    end
  end

  # layout :layout_by_resource

  # protected

  # def layout_by_resource
  #   if devise_controller?
  #     "devise"
  #   else
  #     "application"
  #   end
  # end

end
