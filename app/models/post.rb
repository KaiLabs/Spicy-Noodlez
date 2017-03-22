class Post < ApplicationRecord


	def self.print_attributes(post)
		x = "Category: #{post.class} \n"
		post.attributes.each_pair do |key, val|
			if val.is_a?(ActiveSupport::TimeWithZone)
				x = "#{x}" + "#{key}: #{Common.readable_timestamps(val)} \n"
			else
				x = "#{x}" + "#{key}: #{val} \n"
			end
		end
		return x
	end
end

