class AddHideNotificationsCheckboxToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :show_notifications, :boolean
  end
end
