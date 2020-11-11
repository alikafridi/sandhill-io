class CreateMobileAppsCategoryJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :mobile_apps, :categories do |t|
      t.index [:mobile_app_id, :category_id]
      t.index [:category_id, :mobile_app_id]
    end
  end
end