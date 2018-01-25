class RemoveFieldFromReplies < ActiveRecord::Migration[5.1]
  def change
    remove_column :replies, :author

  end
end
