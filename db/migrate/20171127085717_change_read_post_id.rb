class ChangeReadPostId < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :read_post_ids, :text
   # add_column :users, :read_post_ids, :text, default: [], array: true

  end
end
