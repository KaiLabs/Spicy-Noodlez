class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
	rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
	rescue_from ActionController::RoutingError, :with => :rescue404

	def rescue404
		log_out
	#your custom method for errors, you can render anything you want there
	end
end
