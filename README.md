# README

A one-stop-shop for Wesleyan University for ridesharing, event posting, lost & found, trading post, and etc. A project for Kai Labs in the Spring of 2017.

Completed so far:
1. Created Events, Rides, Lostandfounds
2. Created Users
3. Created Sessions
4. Google OAuth for Wesleyan Portal
5. Validators to make sure posts are informative enough
6. ReRouting properly
7. Attempts at DRYness
8. Search Bar
9. SSL --> Passwords
10. users has_many events, rides, lostandfounds
	while events, rides, lostandfounds belongs_to users
11. log_in + authenticating users --> session cookies
12. Permission to post vs. simply view
13. Static Routes: help, about, contact
14. Mailers for post notifications
15. Users destroying themselves results in deleting all of that users posts
16. Delete old records from DB 
	--> see lib/tasks/ and also config/schedule.rb
17. See all user contributions
18. Error Handling
19. Session Helpers
20. Calendar View!

To Complete:
1. Write Tests
2. Upvoting / Downvoting
3. Starring Posts
4. Sorting / Filtering by stars, closeness (in time) and views(?)
5. Contact Driver/Finder by email
6. Include Tags to sort by?
7. The Trading Post
8. Prettify the Ruby --> DRY  # Rubocop
9. FRONT END


Some useful Gems:
# Wesleyan Portal Helper
gem 'omniauth-google-oauth2', '~> 0.2.1'
# Scheduling DB record deletion
gem 'whenever', :require => false
# Pagination
gem 'kaminari'
# Form Helper
gem 'simple_form'
# Boostrap
gem 'bootstrap-sass',   '~> 3.3.6'
# Twitter CSS Stylesheets
gem "twitter-bootstrap-rails"
# Materialize
gem 'materialize-sass'
gem 'material_icons'
# Fonts
gem 'font-awesome-sass'
# Pagination from Hartl
gem 'will_paginate',           '3.1.0'
gem 'bootstrap-will_paginate', '0.0.10'
# Time Validations
gem 'validates_timeliness', '~> 4.0'
# Simple Calendar
gem 'simple_calendar',  '~> 2.0'
# Encryption
gem 'bcrypt',           '~> 3.1.11'
