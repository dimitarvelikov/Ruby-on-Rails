class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :publisher
      t.text :content
      t.datetime :posted

      t.timestamps
    end
  end
end
