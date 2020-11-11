class ChangeDomainFromCompanies < ActiveRecord::Migration[5.1]
  def change
  	remove_column :companies, :domain
  	add_column :companies, :main_domain, :string
  end
end
