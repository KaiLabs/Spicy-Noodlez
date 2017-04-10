class AddSeatsToRides < ActiveRecord::Migration[5.0]
  def change
    add_column :rides, :seats, :integer
  end
end
