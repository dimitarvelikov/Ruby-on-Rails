class AddReadPostsIdArrayColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :read_post_id, :integer
  end
end
