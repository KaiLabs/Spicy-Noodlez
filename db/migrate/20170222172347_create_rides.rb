class CreateRides < ActiveRecord::Migration[5.0]
  def change
    create_table :rides do |t|
      t.string :title
      t.string :origin
      t.string :destination
      t.integer :seats
      t.datetime :when
      t.string :role
      t.text :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :rides, [:user_id, :created_at]

  end
end
