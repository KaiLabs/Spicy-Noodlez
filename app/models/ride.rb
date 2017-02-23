class Ride < ApplicationRecord
	def self.search(search)
		where("destination LIKE ? OR origin LIKE ? OR description LIKE ? OR role LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%",  "%#{search}%")
	end
end
