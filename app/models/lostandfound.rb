class Lostandfound < ApplicationRecord
	validates :title, length: { in: 2..50 }
	validates :item, length: {in: 2..50}
	validates :foundlocation, length: {maximum: 50}
	validates :foundtime, presence: true
	validates :notes, length: {maximum: 500}
	validates_datetime :foundtime, :before => :now
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
	scope :yesterday, -> {where(foundtime: Date.yesterday.beginning_of_day..Date.today.beginning_of_day)}
  	scope :today, -> {where(foundtime: Date.today.beginning_of_day..Date.today.end_of_day)}
  	scope :tomorrow, -> {where(foundtime: Date.tomorrow.beginning_of_day..Date.tomorrow.end_of_day)}
  	scope :thisweek, -> {where(foundtime: Date.today.beginning_of_week.beginning_of_day..Date.today.end_of_week.end_of_day)}
	validates :user_id, presence: true
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, 
							   default_url: "http://vignette3.wikia.nocookie.net/simpsons/images/6/60/No_Image_Available.png/revision/latest?cb=20130527163652"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	acts_as_votable
  	acts_as_saveable

	def self.search(search)
		where("title LIKE ? OR item LIKE ? OR foundlocation LIKE ? OR notes LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	end


end
