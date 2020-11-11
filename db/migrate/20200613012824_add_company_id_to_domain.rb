class AddCompanyIdToDomain < ActiveRecord::Migration[5.1]
  def change
    add_column :domains, :company_id, :integer
  end
end
