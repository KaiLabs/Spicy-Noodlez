# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create!(id: 1, 
	provider: "google_oauth2", 
	uid: "115733573135704211361", 
	username: "Fabien Bessez", 
	oauth_token: "ya29.Glw7BHdxCG0KW0uhG-HsgQccAWNAYYwJ7ZBYaSCn-N5R4iuPmkbNdB8O8zJgKyVZvc3LU5HjQxc0Dy3YzGC5AaGnSPB92IdbUAu55QGQhw2_iNTycA7dVsErH8gfLw", 
	email: nil, 
	admin: true, 
	avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, 
	oauth_expires_at: "2017-04-29 21:36:56", 
	created_at: "2017-04-29 20:32:10", 
	updated_at: "2017-04-29 20:36:58")


# user.rides.build()
user.events.build(
	id: 1, 
	title: "This is a test", 
	description: "I tihnk he will222be able to.", 
	location: "Can Fabien edit your thing?", 
	startdate: "2017-04-29 20:44:00", 
	enddate: "2017-04-29 20:54:00", 
	link: "", 
	avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, 
	user_id: 1, 
	created_at: "2017-04-29 20:36:06", 
	updated_at: "2017-04-29 20:39:18")

# user.lostandfounds.build()
# user.trading_posts.build()




