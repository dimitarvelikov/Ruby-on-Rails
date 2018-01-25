class AddAnnonymousToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :annonymous, :boolean
  end
end
