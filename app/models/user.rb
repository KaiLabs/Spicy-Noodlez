class User < ApplicationRecord
	has_many :rides, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :lostandfounds, dependent: :destroy
	
	VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	before_save { self.email = email.downcase }
	validates :username, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 },
					 	format: { with: VALID_EMAIL_REGEX }, 
					 	uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	before_create :confirmation_token

  # Returns the hash digest of the given string.
	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
													BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

    # Returns a random token.
	def self.new_token
		SecureRandom.urlsafe_base64
	end

  # Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Returns true if the given token matches the digest.
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		Crypt::Password.new(digest).is_password?(token)
	end

	# Forgets a user.
	def forget
		update_attribute(:remember_digest, nil)
	end

	def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
    
	def email_activate
		self.email_confirmed = true
		self.confirm_token = nil
		save!(:validate => false)
	end

end
