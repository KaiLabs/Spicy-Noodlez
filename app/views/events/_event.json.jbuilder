json.extract! event, :id, :title, :location, :description, :startdate, :enddate, :link, :created_at, :updated_at
json.url event_url(event, format: :json)