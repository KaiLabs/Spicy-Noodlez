class Post < ApplicationRecord
	def self.search(search)
		where("title LIKE ? OR location LIKE ? OR description LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%")
	end
end
