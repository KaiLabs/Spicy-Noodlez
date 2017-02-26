class AddTitleToRides < ActiveRecord::Migration[5.0]
  def change
    add_column :rides, :title, :string
  end
end
