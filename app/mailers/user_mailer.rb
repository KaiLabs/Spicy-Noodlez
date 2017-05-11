class UserMailer < ApplicationMailer
# http://localhost:3000/rails/mailers/user_mailer/contact_user.txt
	def contact_user(user, email, owner_id, post_id, type)
		@user = user
		@email = email
		@owner = User.find(owner_id)
		if type == "Ride"
			@post = Ride.find(post_id)
		elsif type == "Event"
			@post = Event.find(post_id)
		elsif type == "Lostandfound"
			@post = Lostandfound.find(post_id)
		else
			@post = TradingPost.find(post_id)
		end
		mail(to: @owner.email, subject: "Your post on WesAdmits: #{@post.title}")
	end
end
