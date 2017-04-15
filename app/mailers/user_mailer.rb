class UserMailer < ApplicationMailer
# http://localhost:3000/rails/mailers/user_mailer/contact_user.txt
	def contact_user(user, email, owner_id, post_id, type)
		@user = user
		@email = email
		@owner = User.find(owner_id)
		if type == "ride"
			@post = Ride.find(post_id)
		elsif type == "event"
			@post = Event.find(post_id)
		elsif type == "lostandfound"
			@post = Lostandfound.find(post_id)
		end
		mail(to: @owner.email, subject: "Your post on WesAdmits: #{@post.title}")
	end
end
