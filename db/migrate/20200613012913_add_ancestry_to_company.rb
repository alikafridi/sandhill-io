class AddAncestryToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :ancestry, :string
    add_index :companies, :ancestry
  end
end
