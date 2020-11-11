class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :latitude
      t.string :longitude
      t.string :slug
      t.string :ancestry

      t.timestamps
    end
    add_index :locations, :slug, unique: true
    add_index :locations, :ancestry
  end
end
