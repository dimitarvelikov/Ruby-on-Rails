class ModifyReplyAuthorToUserId < ActiveRecord::Migration[5.1]
  def change
    remove_column :replies, :author, :string

  end
end
