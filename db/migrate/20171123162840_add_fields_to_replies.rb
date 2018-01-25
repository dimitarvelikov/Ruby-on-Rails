class AddFieldsToReplies < ActiveRecord::Migration[5.1]
  def change
    add_column :replies, :author, :string
    add_column :replies, :annonymous, :boolean
    add_column :replies, :text, :text

  end
end
