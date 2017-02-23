# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





Ride.create(
	"destination": "Chipotle",
	"origin": "Usdan",
	"when": "2017-02-22 9:03:00 UTC",
	"role": "driver",
	"notes": "I will provide snacks!")
Event.create(
	"title": "Party", 
	"location":"211 Pine", 
	"description":"House Warming BYOG", 
	"startdate": "2017-02-22 9:03:00 UTC",
	"enddate": "2017-02-25 12:03:00 UTC",
	"link": "https://www.facebook.com")
Event.create(
	"title": "Sleep", 
	"location":"211 Pine", 
	"description":"Just for funsies", 
	"startdate": "2016-03-22 12:03:00 UTC",
	"enddate": "2016-03-25 20:03:00 UTC",
	"link": "https://www.facebook.com")
Lostandfound.create(
	"title": "LOST JACKET",
	"item": "Black Jacket with rhinestones",
	"foundlocation": "Usdan Quiet Side",
	"foundtime": "2016-03-25 20:03:00 UTC")
