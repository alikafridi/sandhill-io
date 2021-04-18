class AddNewFieldsToFeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :feeds, :primary_role, :string
    add_column :feeds, :email_descript, :string
    add_column :feeds, :firm_name, :string
    add_column :feeds, :address, :string
    add_column :feeds, :latitude, :float
    add_column :feeds, :longitude, :float
  end
end
