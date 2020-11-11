class CreateAppData < ActiveRecord::Migration[5.1]
  def change
    create_table :app_data do |t|
      t.integer :app_id
      t.string :app_type
      t.integer :monthly_revenue
      t.integer :monthly_downloads
      t.datetime :date_collected

      t.timestamps
    end
    add_index :app_data, :app_id
  end
end
