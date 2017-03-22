class Event < ApplicationRecord
	validates :title, length: {in: 5..50}
	validates :location, length: {in: 5..50}
	validates :description, length: {maximum: 500}
	validates :startdate, :enddate, presence: true
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
		@x = time_offset(event[:startdate])
		@y = time_offset(event[:enddate])
		event[:startdate] = @x
		event[:enddate] = @y
		return event
	end

end
