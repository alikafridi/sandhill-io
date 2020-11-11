class RemoveCategoryFromDomains < ActiveRecord::Migration[5.1]
  def change
  	remove_column :domains, :category
  end
end
