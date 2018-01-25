class AddReadpostidsToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :read_post_ids, :user, foreign_key: true
  end
end
