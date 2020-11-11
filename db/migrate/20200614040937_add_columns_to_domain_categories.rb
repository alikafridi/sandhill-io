class AddColumnsToDomainCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :domain_categories, :domain_id, :integer
    add_column :domain_categories, :category_id, :integer

    add_index :domain_categories, :category_id
    add_index :domain_categories, :domain_id

  end
end
