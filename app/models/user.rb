class User < ApplicationRecord
	has_many :rides, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :lostandfounds, dependent: :destroy
	
	# VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	# before_save { self.email = email.downcase }
	# validates :username, presence: true, length: { maximum: 50 }
	# validates :email, presence: true, length: { maximum: 255 },
	# 				 	format: { with: VALID_EMAIL_REGEX }, 
	# 				 	uniqueness: { case_sensitive: false }
	# has_secure_password
	# validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	# before_create :confirmation_token

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
	   user.provider = auth.provider
		user.uid = auth.uid
		user.username = auth.info.name
		user.oauth_token = auth.credentials.token
		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
		user.save!
	  end
	end

end
