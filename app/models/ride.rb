# class MyValidator < ActiveModel::Validator
# 	# startdate_cannot_be_in_the_past
# 	def validate(record)
# 		startdate = record[:when]
# 		if startdate.present? && startdate < Time.now
# 			record.errors.add(:Ride, "The ride can't be in the past")
# 		end
# 	end
# end

	# include ActiveModel::Validations
	# validates_with MyValidator

class Ride < ApplicationRecord
	validates :title, length: { in: 2..100 }
	validates :destination, length: {in: 2..50}
	validates :origin, length: {in: 2..50}
	validates :when, :role, presence: true
	validates :notes, length: {maximum: 500}

	validate :startdate_cannot_be_in_the_past
	attr_accessor :when

	def self.search(search)
		where("destination LIKE ? OR origin LIKE ? OR title LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%")
	end

	# startdate_cannot_be_in_the_past
	def startdate_cannot_be_in_the_past
		if @when.present? && @when < Time.now
			errors.add(:Ride, "The ride can't be in the past")
		end
	end

end
