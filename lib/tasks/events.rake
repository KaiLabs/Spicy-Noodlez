namespace :events do
  desc "Delete events that finished more than 7 days ago"
  task delete_after_finished: :environment do
  	Event.where(['enddate < ?', 7.days.ago]).destroy_all
  end
end
