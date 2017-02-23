class AddStartdateToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :startdate, :datetime
  end
end
