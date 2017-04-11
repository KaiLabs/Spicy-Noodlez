class UserMailer < ApplicationMailer
	default from: 'b16fabien@gmail.com'
# http://localhost:3000/rails/mailers/user_mailer/contact_user.txt
	def contact_user(user)
		@user = user
		mail(to: @user.email, subject:"This is an email")
	end
end
