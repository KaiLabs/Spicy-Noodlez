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
		@x = time_offset(event[:startdate])
		@y = time_offset(event[:enddate])
		event[:startdate] = @x
		event[:enddate] = @y
		return event
	end


	validate :date_cannot_be_in_the_past
    validate :start_before_end

    def self.start_time
        self.startDay
    end

    def self.date_cannot_be_in_the_past
        hour = Time.now.strftime('%k').to_i
        min = Time.now.strftime('%M').to_i
        if startDay < Date.today
            errors.add(:Event, "can not be in the past")
        elsif startDay == Date.today
            if startTime.strftime('%k').to_i < hour
                    errors.add(:Event, "can not be in the past")
            elsif startTime.strftime('%k').to_i == hour
                if startTime.strftime('%M').to_i < min
                    errors.add(:Event, "can not be in the past")
                end
            end
        end
    end


    def self.start_before_end
        if endDay < startDay
            errors.add(:Event, "end can not be before start")
        elsif endDay == startDay
            if endTime.strftime('%k').to_i < startTime.strftime('%k').to_i
                errors.add(:Event, "end can not be before start")
            elsif endTime.strftime('%k').to_i == startTime.strftime('%k').to_i
                if endTime.strftime('%M').to_i < startTime.strftime('%M').to_i
                    errors.add(:Event, "end can not be before start")
                end
            end
        end
    end
end