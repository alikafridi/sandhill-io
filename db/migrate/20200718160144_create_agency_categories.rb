class CreateAgencyCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :agency_categories do |t|
      t.integer :agency_id
      t.integer :category_id

      t.timestamps
    end
  end
end
