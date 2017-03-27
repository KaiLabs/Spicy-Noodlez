class Lostandfound < ApplicationRecord
	validates :title, length: { in: 2..50 }
	validates :item, length: {in: 2..50}
	validates :foundlocation, length: {maximum: 50}
	validates :foundtime, presence: true
	validates :notes, length: {maximum: 500}

	validates_datetime :foundtime, :before => :now

	def self.search(search)
		where("title LIKE ? OR item LIKE ? OR foundlocation LIKE ? OR notes LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	end
end
