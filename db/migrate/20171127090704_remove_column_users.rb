class RemoveColumnUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :read_post_ids, :text
  end
end
