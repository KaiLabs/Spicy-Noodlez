class UserMailer < ApplicationMailer
	default from: 'b16fabien@gmail.com'
# http://localhost:3000/rails/mailers/user_mailer/contact_user.txt
	def contact_user(user, post)
		@user = user
		@post = post
		mail(to: @user.email, subject: "Your post: #{@post.title}")
	end
end
