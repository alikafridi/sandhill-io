class AddCategoryIdToDomains < ActiveRecord::Migration[5.1]
  def change
    add_column :domains, :category_id, :integer
  end
end
