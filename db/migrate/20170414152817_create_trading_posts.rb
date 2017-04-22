class CreateTradingPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :trading_posts do |t|
      t.string :title
      t.text :notes
      t.integer :price
      t.string :role
      t.attachment :avatar
      t.integer :user_id

      t.timestamps
    end
  end
end
