class RemoveFieldNameFromComment < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :posted, :datetime
  end
end
