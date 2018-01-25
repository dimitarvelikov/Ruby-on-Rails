class DeleteReadPostIdFromUserTabble < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :read_post_ids
  end
end
