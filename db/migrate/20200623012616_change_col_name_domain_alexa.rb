class ChangeColNameDomainAlexa < ActiveRecord::Migration[5.1]
  def change
  	add_column :domain_alexas, :domain_url, :string
  	remove_column :domain_alexas, :domain, :string
  end
end
