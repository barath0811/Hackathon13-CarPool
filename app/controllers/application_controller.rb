class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :store_location

	def store_location
	  # store last url as long as it isn't a /users path
	  session[:previous_url] = request.fullpath  
	end

	def after_sign_in_path_for(resource)
		request.env['omniauth.origin'] || session[:previous_url] || root_path
	end
end
