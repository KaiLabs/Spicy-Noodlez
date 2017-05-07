class TradingPost < ApplicationRecord
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	belongs_to :user
  	scope :yesterday, -> {where(created_at: Date.yesterday.beginning_of_day..Date.today.beginning_of_day)}
  	scope :today, -> {where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)}
  	scope :tomorrow, -> {where(created_at: Date.tomorrow.beginning_of_day..Date.tomorrow.end_of_day)}
  	scope :thisweek, -> {where(created_at: Date.today.beginning_of_week.beginning_of_day..Date.today.end_of_week.end_of_day)}
  	
  	acts_as_votable
  	acts_as_saveable

  	
	def self.search(search)
		where("title LIKE ? OR notes LIKE ? ", 
			"%#{search}%", "%#{search}%")
	end
end
