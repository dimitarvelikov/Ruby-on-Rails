class ReadPostIdStringToText < ActiveRecord::Migration[5.1]

  def change
    change_column :users, :read_post_id, :text
    rename_column :users, :read_post_id, :read_post_ids
  end
end
