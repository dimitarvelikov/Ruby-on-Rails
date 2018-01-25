class AddSelfReferenceToReplies < ActiveRecord::Migration[5.1]
  def change
    add_column :replies, :parent_id, :integer
    add_reference :replies, :reply, foreign_key: {on_delete: :cascade}
  end
end
