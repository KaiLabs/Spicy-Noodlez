class Ride < ApplicationRecord
	validates :title, length: { in: 2..100 }
	validates :destination, length: {in: 2..50}
	validates :origin, length: {in: 2..50}
	validates :when, :role, presence: true
	validates :notes, length: {maximum: 500}
	# validates :seats, presence: true
	validates_datetime :when, :after => :now
	belongs_to :user
	default_scope -> {order(created_at: :desc) }
	scope :yesterday, ->{where(:when =>  Date.yesterday.beginning_of_day..Date.today.beginning_of_day)}
  	scope :today, -> 	{where(:when =>  Date.today.beginning_of_day..Date.today.end_of_day)}
  	scope :tomorrow, -> {where(:when =>  Date.tomorrow.beginning_of_day..Date.tomorrow.end_of_day)}
  	scope :thisweek, -> {where(:when =>  Date.today.beginning_of_week.beginning_of_day..Date.today.end_of_week.end_of_day)}
	validates :user_id, presence: true
	def self.search(search)
		where("destination LIKE ? OR origin LIKE ? OR title LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%")
	end

end
