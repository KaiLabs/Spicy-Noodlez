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
