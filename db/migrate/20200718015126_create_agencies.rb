class CreateAgencies < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :image_url
      t.string :logo_url
      t.string :domain
      t.string :type
      t.string :clients

      t.timestamps
    end
  end
end
