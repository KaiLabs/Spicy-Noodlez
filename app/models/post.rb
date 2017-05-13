class Post < ApplicationRecord
	# Creating Scopes
    # scope :up, lambda{ where(:save_flag => true) }
    # scope :down, lambda{ where(:save_flag => false) }
    # scope :for_type, lambda{ |klass| where(:saveable_type => klass) }
    # scope :by_type,  lambda{ |klass| where(:saver_type => klass) }


	def self.print_attributes(post)
		x = "Category: #{post.class} \n"
		post.attributes.each_pair do |key, val|
			if val.is_a?(ActiveSupport::TimeWithZone)
				x = "#{x}" + "#{key}: #{Common.readable_timestamps(val)} \n"
			else
				x = "#{x}" + "#{key}: #{val} \n"
			end
		end
		return x
	end

	def self.get_everything()
		rides = Ride.all
		events = Event.all
		lost_and_founds = Lostandfound.all
		trades = TradingPost.all
		@posts = rides + events + lost_and_founds + trades
		return @posts
	end

	def self.search_everything(params)
		rides = Ride.all.search(params[:search])
		events = Event.all.search(params[:search])
		lost_and_founds = Lostandfound.all.search(params[:search])
		trades = TradingPost.all.search(params[:search])
		@posts = rides + events + lost_and_founds + trades
		return @posts.sort_by(&:updated_at)
	end

	def self.filter_by(params)
		if params[:sorting] == "yesterday"
			@posts = (Ride.yesterday + Event.yesterday + Lostandfound.yesterday + TradingPost.yesterday).sort_by(&:created_at)
		elsif params[:sorting] == "today"
			@posts = (Ride.today + Event.today + Lostandfound.today + TradingPost.today).sort_by(&:created_at)
		elsif params[:sorting] == "tomorrow"
			@posts = (Ride.today + Event.tomorrow + Lostandfound.tomorrow + TradingPost.tomorrow).sort_by(&:created_at)
		elsif params[:sorting] == "week"
			@posts = (Ride.thisweek + Event.thisweek + Lostandfound.thisweek + TradingPost.thisweek).sort_by(&:created_at)
		end
		return @posts
	end


	def self.get_times(post)
		if post.is_a?(Event)
			"#{post.startdate.to_formatted_s(:short)} - #{post.enddate.to_formatted_s(:short)}"
		elsif post.is_a?(Ride)
			"#{post.time.to_formatted_s(:short)}"
		elsif post.is_a?(TradingPost)
			"Buy it now!"
		else  # post.is_a?(Lostandfound)
			"#{post.foundtime.to_formatted_s(:short)}"
		end
	end


	def self.get_notes(post)
		if post.is_a?(Event)
			"#{post.description}"
		elsif post.is_a?(Ride)
			"#{post.notes}..#{post.seats} seats!"
		else  # post.is_a?(Lostandfound)
			"#{post.notes}"
		end
	end

	def self.get_title(post)
		if post.is_a?(Event)
			"#{post.title}"
		elsif post.is_a?(Ride)
			if post.role = "Driver"
				"DRIVING: #{post.title}"
			else
				"NEEDS A RIDE: #{post.title}"
			end
		elsif post.is_a?(Lostandfound)
			if post.lostorfound == "Lost"
				"LOST: #{post.title}" 
			else
				"FOUND: #{post.title}"
			end
		else  # post.is_a?(TradingPost)
			if post.role == "Buying"
				"BUYING: #{post.title}"
			else
				"SELLING: #{post.title}"
			end
		end
	end

	def self.get_location(post)
		if post.is_a?(Event)
			"#{post.location}"
		elsif post.is_a?(Ride)
			"#{post.origin} - #{post.destination}"
		elsif post.is_a?(TradingPost)
			"Wesleyan University"
		else  # post.is_a?(Lostandfound)
			"#{post.foundlocation}"
		end
	end


end

