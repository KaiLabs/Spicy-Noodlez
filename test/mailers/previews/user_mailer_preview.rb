# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

	def contact_user
		UserMailer.contact_user(User.first)
	end
end
