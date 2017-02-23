class CreateLostandfounds < ActiveRecord::Migration[5.0]
  def change
    create_table :lostandfounds do |t|
      t.string :title
      t.string :item
      t.string :foundlocation
      t.datetime :foundtime
      t.text :notes

      t.timestamps
    end
  end
end
