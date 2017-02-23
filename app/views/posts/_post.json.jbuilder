json.extract! post, :id, :startdate, :enddate, :title, :location, :description, :created_at, :updated_at
json.url post_url(post, format: :json)