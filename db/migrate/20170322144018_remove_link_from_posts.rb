class RemoveLinkFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :link, :string
  end
end
