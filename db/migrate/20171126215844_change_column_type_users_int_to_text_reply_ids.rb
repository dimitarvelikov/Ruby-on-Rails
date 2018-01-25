class ChangeColumnTypeUsersIntToTextReplyIds < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :read_post_id, :text
  end
end
