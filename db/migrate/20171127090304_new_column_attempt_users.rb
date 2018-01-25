class NewColumnAttemptUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :read_post_ids, :text, default: [].to_yaml, array: true

  end
end
