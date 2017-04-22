class TradingPost < ApplicationRecord
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	belongs_to :user

	def self.search(search)
		where("title LIKE ? OR notes LIKE ? ", 
			"%#{search}%", "%#{search}%")
	end
end
