class AddReplyToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :replies, :comment, foreign_key: true
  end
end
