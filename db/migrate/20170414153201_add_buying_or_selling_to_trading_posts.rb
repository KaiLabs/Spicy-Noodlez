class AddBuyingOrSellingToTradingPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :trading_posts, :role, :string
  end
end
