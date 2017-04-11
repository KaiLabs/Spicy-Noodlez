# README

A one-stop-shop for Wesleyan University for ridesharing, event posting, lost & found, trading post, and etc. A project for Kai Labs in the Spring of 2017.

<h3> Completed so far:</h3> 
<ul>
	<li>1. Created Events, Rides, Lostandfounds</li> 
	<li>2. Created Users</li> 
	<li>3. Created Sessions</li> 
	<li>4. Google OAuth for Wesleyan Portal</li> 
	<li>5. Validators to make sure posts are informative enough</li> 
	<li>6. ReRouting properly</li> 
	<li>7. Attempts at DRYness</li> 
	<li>8. Search Bar</li> 
	<li>9. SSL --> Passwords</li> 
	<li>10. users has_many events, rides, lostandfounds
		while events, rides, lostandfounds belongs_to users</li> 
	<li>11. log_in + authenticating users --> session cookies</li> 
	<li>12. Permission to post vs. simply view</li> 
	<li>13. Static Routes: help, about, contact</li> 
	<li>14. Mailers for post notifications</li> 
	<li>15. Users destroying themselves results in deleting all of that users posts</li> 
	<li>16. Delete old records from DB 
		--> see lib/tasks/ and also config/schedule.rb</li> 
	<li>17. See all user contributions</li> 
	<li>18. Error Handling</li> 
	<li>19. Session Helpers</li> 
	<li>20. Calendar View!</li> 
</ul>

<h3> To Complete:</h3> 
<ul> 
	<li>1. Write Tests</li> 
	<li>2. Upvoting / Downvoting</li> 
	<li>3. Starring Posts</li> 
	<li>4. Sorting / Filtering by stars, closeness (in time) and views(?)</li> 
	<li>5. Contact Driver/Finder by email</li> 
	<li>6. Include Tags to sort by?</li> 
	<li>7. The Trading Post</li> 
	<li>8. Prettify the Ruby --> DRY  # Rubocop</li> 
	<li>9. FRONT END</li> 
</ul>


<h3> Some useful Gems: </h3> 
<h5> Wesleyan Portal Helper</h5>
gem 'omniauth-google-oauth2', '~> 0.2.1'
<h5>Scheduling DB record deletion</h5>
gem 'whenever', :require => false
<h5>Pagination</h5>
gem 'kaminari'
<h5>Form Helper</h5>
gem 'simple_form'
<h5>Boostrap</h5>
gem 'bootstrap-sass', '~> 3.3.6'
<h5>Twitter CSS Stylesheets</h5>
gem "twitter-bootstrap-rails"
<h5>Materialize</h5>
gem 'materialize-sass'
gem 'material_icons'
<h5>Fonts</h5>
gem 'font-awesome-sass'
<h5>Pagination from Hartl</h5>
gem 'will_paginate', '3.1.0'
gem 'bootstrap-will_paginate', '0.0.10'
<h5>Time Validations</h5>
gem 'validates_timeliness', '~> 4.0'
<h5>Simple Calendar</h5>
gem 'simple_calendar','~> 2.0'
<h5>Encryption</h5>
gem 'bcrypt', '~> 3.1.11'
