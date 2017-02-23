class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :description
      t.datetime :startdate
      t.datetime :enddate
      t.text :link

      t.timestamps
    end
  end
end
