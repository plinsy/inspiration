class ApplicationController < ActionController::Base
	add_flash_types :success, :info, :warning, :danger
	protect_from_forgery with: :exception

	before_action :configure_devise_parameters, if: :devise_controller?

	def configure_devise_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u| 
			u.permit(:username, :email, :firstname, :lastname, :birthdate, :password, :password_confirmation)
		}
	  devise_parameter_sanitizer.permit(:sign_in) {|u| 
	    u.permit(:email, :password, :remember_me)
	  }
	  devise_parameter_sanitizer.permit(:account_update) {|u| 
	   u.permit(:username, :email, :password, :password_confirmation, :current_password)		
	  }
	end
end
