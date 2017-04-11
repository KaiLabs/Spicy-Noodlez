namespace :rides do
  desc "TODO"
  task delete_after_finished: :environment do
  	Ride.where(['when < ?', 7.days.ago]).destroy_all
  end

end
