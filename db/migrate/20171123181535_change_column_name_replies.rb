class ChangeColumnNameReplies < ActiveRecord::Migration[5.1]
  def change
    rename_column :replies, :annonymous, :anonymous
  end
end
