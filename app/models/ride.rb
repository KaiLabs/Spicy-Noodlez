class Ride < ApplicationRecord
	validates :title, length: { in: 2..100 }
	validates :destination, length: {in: 2..50}
	validates :origin, length: {in: 2..50}
	validates :when, :role, presence: true
	validates :notes, length: {maximum: 500}
	validates_datetime :when, :after => :now
	belongs_to :user
	default_scope -> {order(created_at: :desc) }
	validates :user_id, presence: true
	def self.search(search)
		where("destination LIKE ? OR origin LIKE ? OR title LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%")
	end

end
