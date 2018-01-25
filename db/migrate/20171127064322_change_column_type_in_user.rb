class ChangeColumnTypeInUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :read_post_id, :string
    rename_column :users, :read_post_id, :read_post_id
  end
end
