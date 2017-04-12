module ApplicationHelper

	def post_path_helper(type, post_id)
		if type == "ride"
			Ride.find(post_id)
		elsif type == "lostandfound"
			Lostandfound.find(post_id)
		elsif type == "event"
			Event.find(post_id)
		end
	end
end
