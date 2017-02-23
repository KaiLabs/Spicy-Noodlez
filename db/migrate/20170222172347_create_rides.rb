class CreateRides < ActiveRecord::Migration[5.0]
  def change
    create_table :rides do |t|
      t.string :destination
      t.string :origin
      t.datetime :when
      t.string :role
      t.text :notes

      t.timestamps
    end
  end
end
