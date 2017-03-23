class Common < ApplicationRecord
	def self.readable_timestamps(timestamp)
		timestamp.strftime('%a, %d %b %Y %H:%M:%S')
	end

	# Converts from UTC to EST
	def self.time_offset(timestamp)
		timestamp + Time.zone_offset('EST')
	end

	def self.convert_times(event)
		# To get rid of the "UTC" I think i have to convert
		# from datetime type to string type then do [0..18]
		event[:startdate] = time_offset(event[:startdate])
		event[:enddate] = time_offset(event[:enddate])
		return event
	end

end