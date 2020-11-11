class CreateMobileApps < ActiveRecord::Migration[5.1]
  def change
    create_table :mobile_apps do |t|
      t.string :name
      t.string :slug
      t.string :ios_link
      t.string :android_link
      t.string :ios_sensortower_link
      t.string :android_sensortower_link
      t.string :company_id

      t.timestamps
    end
    add_index :mobile_apps, :slug, unique: true
  end
end
