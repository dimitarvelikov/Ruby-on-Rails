class CreatePostNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :post_notifications do |t|
      t.integer :post_id
      t.boolean :seen

      t.timestamps
    end
  end
end
