class CreateDomainCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :domain_categories do |t|
      t.string :domain
      t.string :category

      t.timestamps
    end
  end
end
