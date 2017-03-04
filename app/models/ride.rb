class Ride < ApplicationRecord

	def self.search(search)
		where("destination LIKE ? OR origin LIKE ? OR title LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%")
	end
end
