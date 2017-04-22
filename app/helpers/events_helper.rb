module EventsHelper



	# Checks to see if given event is already favorited!
	# This way you can't favorite twice!
	
	def already_favorited?(event)
		if current_user
			current_user.events.exists?(id: event.id)
		end
	end

end
