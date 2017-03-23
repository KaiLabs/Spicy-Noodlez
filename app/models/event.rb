class Event < ApplicationRecord
	validates :title, length: {in: 5..50}
	validates :location, length: {in: 5..50}
	validates :description, length: {maximum: 500}
	validates :startdate, :enddate, presence: true

	validate :startdate_cannot_be_in_the_past
	validate :enddate_must_be_after_start
	attr_accessor :startdate
	attr_accessor :enddate
	require 'time'

	def self.search(search)
		where("title LIKE ? OR location LIKE ? OR description LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%")
	end

# Converts from UTC to EST --> Moved to common.rb for DRYness
	def self.time_offset(timestamp)
		timestamp + Time.zone_offset('EST')
	end

	def self.convert_times(event)
		# To get rid of the "UTC" I think i have to convert
		# from datetime type to string type then do [0..18]
		event[:startdate] = time_offset(@startdate)
		event[:enddate] = time_offset(@enddate)
		return event
	end

	def startdate_cannot_be_in_the_past
		if @startdate.present? && @startdate < Time.now
			errors.add(:Event, "The event can't be in the past")
		end
	end

	def enddate_must_be_after_start
		if @startdate.present? && @enddate.present? && @enddate <= @startdate
			errors.add(:Event, "The event can't end before it begins")
		end
	end

end
