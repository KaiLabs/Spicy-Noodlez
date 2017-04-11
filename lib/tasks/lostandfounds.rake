namespace :lostandfounds do
  desc "TODO"
  task delete_after_a_while: :environment do
  	Lostandfound.where(['created_at < ?', 20.days.ago]).destroy_all
  end

end
