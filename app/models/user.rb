class User < ApplicationRecord
	has_many :rides, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :lostandfounds, dependent: :destroy
	has_many :trading_posts, dependent: :destroy
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/profile.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	acts_as_saver




	# VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	# before_save { self.email = email.downcase }
	# validates :username, presence: true, length: { maximum: 50 }
	# validates :email, presence: true, length: { maximum: 255 },
	# 				 	format: { with: VALID_EMAIL_REGEX }, 
	# 				 	uniqueness: { case_sensitive: false }
	# has_secure_password
	# validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	# before_create :confirmation_token

# https://github.com/omniauth/omniauth/wiki/auth-hash-schema

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
	   	user.provider = auth.provider
		user.uid = auth.uid
		user.username = auth.info.name
		user.email = auth.info.email
		user.oauth_token = auth.credentials.token
		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
		if user.username == "Fabien Bessez"
			user.admin = true
		else
			user.admin = false
		end
		user.save!
		end
	end

# {
#     :provider => "google_oauth2",
#     :uid => "123456789",
#     :info => {
#         :name => "John Doe",
#         :email => "john@company_name.com",
#         :first_name => "John",
#         :last_name => "Doe",
#         :image => "https://lh3.googleusercontent.com/url/photo.jpg"
#     },
#     :credentials => {
#         :token => "token",
#         :refresh_token => "another_token",
#         :expires_at => 1354920555,
#         :expires => true
#     },
#     :extra => {
#         :raw_info => {
#             :sub => "123456789",
#             :email => "user@domain.example.com",
#             :email_verified => true,
#             :name => "John Doe",
#             :given_name => "John",
#             :family_name => "Doe",
#             :profile => "https://plus.google.com/123456789",
#             :picture => "https://lh3.googleusercontent.com/url/photo.jpg",
#             :gender => "male",
#             :birthday => "0000-06-25",
#             :locale => "en",
#             :hd => "company_name.com"
#         },
#         :id_info => {
#             "iss" => "accounts.google.com",
#             "at_hash" => "HK6E_P6Dh8Y93mRNtsDB1Q",
#             "email_verified" => "true",
#             "sub" => "10769150350006150715113082367",
#             "azp" => "APP_ID",
#             "email" => "jsmith@example.com",
#             "aud" => "APP_ID",
#             "iat" => 1353601026,
#             "exp" => 1353604926,
#             "openid_id" => "https://www.google.com/accounts/o8/id?id=ABCdfdswawerSDFDsfdsfdfjdsf"
#         }
#     }
# }
end
