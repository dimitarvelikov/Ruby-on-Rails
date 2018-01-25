class AddPostNotificationToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :post_notifications, :user, foreign_key: true
  end
end
