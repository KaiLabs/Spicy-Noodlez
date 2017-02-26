class Post < ApplicationRecord
	# include Event, Post, Lostandfound
	def self.search(search)
		where("title LIKE ?", "%#{search}%")
	end

	def self.print_attributes(post)
		x = ""
		post.attributes.each_pair do |key, val|
			x = "#{x}" + "#{key}: #{val} \n"
		end
		return x
	end
end

