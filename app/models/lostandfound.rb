class Lostandfound < ApplicationRecord
	validates :title, length: { in: 2..50 }
	validates :item, length: {in: 2..50}
	validates :foundlocation, length: {maximum: 50}
	validates :foundtime, presence: true
	validates :notes, length: {maximum: 500}

	validate :foundtime_must_be_in_the_past
	attr_accessor :foundtime

	def self.search(search)
		where("title LIKE ? OR item LIKE ? OR foundlocation LIKE ? OR notes LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	end

	def foundtime_must_be_in_the_past
		if @foundtime.present? && @foundtime > Time.now
			errors.add(:Lostandfound, "You could not have found this in the future")
		end
	end
end
