class CreateReadPostIds < ActiveRecord::Migration[5.1]
  def change
    create_table :read_post_ids do |t|
      t.integer :read_id

      t.timestamps
    end
  end
end
