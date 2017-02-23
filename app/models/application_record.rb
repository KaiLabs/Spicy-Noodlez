class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  	def self.search(search)
		where("title LIKE ? OR location LIKE ? OR description LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%")
	end

	# Converts from UTC to EST
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
