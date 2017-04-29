class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
	rescue_from ActionController::RoutingError, :with => :rescue404
	include SessionsHelper

	def rescue404
		log_out
		redirect_to root_url
		flash[:danger] = "Something went wrong. Check the logs!"
	#your custom method for errors, you can render anything you want there
	end

end
