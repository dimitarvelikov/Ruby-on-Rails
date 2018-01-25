class AddRepliesCountToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :replies_count, :integer
  end
end
