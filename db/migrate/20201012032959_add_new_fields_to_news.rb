class AddNewFieldsToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :date_published, :datetime
    add_column :news, :public, :boolean
  end
end
