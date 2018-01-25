class AddParentNumberToReplies < ActiveRecord::Migration[5.1]
  def change
    add_column :replies, :child_number, :integer
  end
end
