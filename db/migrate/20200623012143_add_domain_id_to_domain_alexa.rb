class AddDomainIdToDomainAlexa < ActiveRecord::Migration[5.1]
  def change
    add_column :domain_alexas, :domain_id, :integer
  end
end
