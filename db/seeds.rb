# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.create(username:  "Example User",
             email: "abc@abc.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
Micropost.create(content: "I don't know", user_id: 1)
Micropost.create(content: "Demonstration", user_id: 1)
Micropost.create(content: "Cookies!", user_id: 1)

# Ride.create(
# 	"title": "Wes -> NYC",
# 	"destination": "New York City",
# 	"origin": "Usdan",
# 	"when": "2018-03-10 16:00:00 UTC",
# 	"role": "Driver",
# 	"notes": "I am driving ppl for free!")
# Ride.create(
# 	"title": "Anyone going to Vassar College?",
# 	"destination": "Vassar",
# 	"origin": "Wesleyan",
# 	"when": "2018-03-08 16:00:00 UTC",
# 	"role": "Rider",
# 	"notes": "I will happily pay $20 to anyone who is going there!")
# Event.create(
# 	"title": "Kai Lab Presentations", 
# 	"location":"Fisk 666", 
# 	"description":"Present where you're at.", 
# 	"startdate": "2018-03-05 7:00:00 UTC",
# 	"enddate": "2018-03-05 12:03:00 UTC",
# 	"link": "http://www.kaiwes.com/")
# Event.create(
# 	"title": "Men's Basketball Game v. Vassar College", 
# 	"location":"Freeman Athletic Center", 
# 	"description":"Come support plz!", 
# 	"startdate": "2018-03-22 12:03:00 UTC",
# 	"enddate": "2018-03-22 20:03:00 UTC",
# 	"link": "http://athletics.wesleyan.edu/landing/index")
# Lostandfound.create(
# 	"title": "Lost my favorite jacket",
# 	"item": "Black jacket with rhinestones",
# 	"foundlocation": "Usdan Quiet Side",
# 	"foundtime": "2016-03-25 20:03:00 UTC",
# 	"notes": "I will bake you some brownies if you find it")
# Lostandfound.create(
# 	"title": "Found a Motorola Razr (pink)",
# 	"item": "Motorola Razr",
# 	"foundlocation": "Meditation Room",
# 	"foundtime": "2016-03-25 20:03:00 UTC",
# 	"notes": "I will be sitting in Roth's office until 3pm today if you want to come by and get it")






