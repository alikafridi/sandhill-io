class CreateJoinTableAgencyCategory < ActiveRecord::Migration[5.1]
  def change
    create_join_table :agencies, :categories do |t|
      t.index [:agency_id, :category_id]
      t.index [:category_id, :agency_id]
    end
  end
end
