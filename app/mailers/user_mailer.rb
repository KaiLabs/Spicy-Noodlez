class UserMailer < ApplicationMailer
	default from: 'b16fabien@gmail.com'
# http://localhost:3000/rails/mailers/user_mailer/contact_user.txt
	def contact_user(user, email, owner_id)
		@user = user
		@email = email
		@owner = User.find(owner_id)
		mail(to: @owner.email, subject: "Your post on WesAdmits", body: @email.body)
	end
end
