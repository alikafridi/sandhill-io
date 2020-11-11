class DropAppIdFromAppData < ActiveRecord::Migration[5.1]
  def change
  	remove_index :app_data, :app_id
  	remove_column :app_data, :app_id
    add_column :app_data, :mobile_app_id, :integer
    add_index :app_data, :mobile_app_id
  end
end
