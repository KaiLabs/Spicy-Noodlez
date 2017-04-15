json.extract! trading_post, :id, :title, :notes, :price, :created_at, :updated_at
json.url trading_post_url(trading_post, format: :json)