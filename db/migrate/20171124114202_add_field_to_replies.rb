class AddFieldToReplies < ActiveRecord::Migration[5.1]
  def change
    add_column :replies, :title, :string
  end
end
