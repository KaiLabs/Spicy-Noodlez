class Event < ApplicationRecord
	validates :title, length: {in: 5..50}
	validates :location, length: {in: 5..50}
	validates :description, length: {maximum: 500}
	validates :startdate, :enddate, presence: true
	validates_datetime :startdate, :after => :now
	validates_datetime :startdate, :before => :enddate
	validates_datetime :enddate, :after => :startdate
	belongs_to :user
  	default_scope -> { order(created_at: :desc) }
  	validates :user_id, presence: true
  	acts_as_votable
  	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://d30y9cdsu7xlg0.cloudfront.net/png/89454-200.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	require 'time'

	def self.search(search)
		where("title LIKE ? OR location LIKE ? OR description LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%")
	end

# Converts from UTC to EST --> Moved to common.rb for DRYness
	def self.time_offset(timestamp)
		timestamp + Time.zone_offset('EST')
	end

end
