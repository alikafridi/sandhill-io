class AddCompanyIdToMobileApps < ActiveRecord::Migration[5.1]
  def change
    remove_column :mobile_apps, :company_id
    add_column :mobile_apps, :company_id, :integer
  end
end
