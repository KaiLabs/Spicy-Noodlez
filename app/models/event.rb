class Event < ApplicationRecord
	validates :title, length: {in: 5..50}
	validates :location, length: {in: 5..50}
	validates :description, length: {maximum: 500}
	validates :startdate, :enddate, presence: true
	validates_datetime :startdate, :after => :now
	validates_datetime :startdate, :before => :enddate
	validates_datetime :enddate, :after => :startdate
	belongs_to :user
  	default_scope -> { order(created_at: :desc) }
  	scope :yesterday, -> {where(startdate: Date.yesterday.beginning_of_day..Date.today.beginning_of_day)}
  	scope :today, -> {where(startdate: Date.today.beginning_of_day..Date.today.end_of_day)}
  	scope :tomorrow, -> {where(startdate: Date.tomorrow.beginning_of_day..Date.tomorrow.end_of_day)}
  	scope :thisweek, -> {where(startdate: Date.today.beginning_of_week.beginning_of_day..Date.today.end_of_week.end_of_day)}
  	validates :user_id, presence: true
  	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://d30y9cdsu7xlg0.cloudfront.net/png/89454-200.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	acts_as_votable
  	acts_as_saveable

	require 'time'

	def self.search(search)
		where("title LIKE ? OR location LIKE ? OR description LIKE ?", 
			"%#{search}%", "%#{search}%", "%#{search}%")
	end

# Converts from UTC to EST --> Moved to common.rb for DRYness
	def self.time_offset(timestamp)
		timestamp + Time.zone_offset('EST')
	end

	def self.sorting(params)
		if params[:sorting] == "yesterday"
			yesterday_range = Date.yesterday.beginning_of_day..Date.today.beginning_of_day
			@events = Event.where(startdate: yesterday_range)
		elsif params[:sorting] == "today"
			today_range = Date.today.beginning_of_day..Date.today.end_of_day
			@events = Event.where(startdate: today_range)
		elsif params[:sorting] == "tomorrow"
			tomorrow_range = Date.tomorrow.beginning_of_day..Date.tomorrow.end_of_day
			@events = Event.where(startdate: tomorrow_range)
		elsif params[:sorting] == "week"
			this_week = Date.today.beginning_of_week.beginning_of_day..Date.today.end_of_week.end_of_day
			@events = Event.where(startdate: this_week)
		end
	end
end
