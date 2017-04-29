class CreateUsers < ActiveRecord::Migration[5.0]
  def change
	  create_table :users, force: :cascade do |t|
	    t.string   :provider
	    t.string   :uid
	    t.string   :username
	    t.string   :oauth_token
	    t.string   :email
	    t.boolean  :admin, 			default: false
	    t.attachment :avatar
	    t.datetime :oauth_expires_at
	    t.datetime :created_at,       null: false
	    t.datetime :updated_at,       null: false
	  end
  end
end
