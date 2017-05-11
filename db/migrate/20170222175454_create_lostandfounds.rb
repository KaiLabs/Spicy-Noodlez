class CreateLostandfounds < ActiveRecord::Migration[5.0]
  def change
    create_table :lostandfounds do |t|
      t.string :title
      t.string :item
      t.string :foundlocation
      t.datetime :foundtime
      t.text :notes
      t.attachment :avatar
      t.references :user, foreign_key: true
      t.string :lostorfound

      t.timestamps
    end
    add_index :lostandfounds, [:user_id, :created_at]

  end
end
