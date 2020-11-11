class DropAgencyCategories < ActiveRecord::Migration[5.1]
  def change
  	drop_table :agency_categories
  end
end
