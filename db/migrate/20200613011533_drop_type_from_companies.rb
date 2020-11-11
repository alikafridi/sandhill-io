class DropTypeFromCompanies < ActiveRecord::Migration[5.1]
  def change
  	remove_column :companies, :type
  	add_column :companies, :stage, :string
  end
end
