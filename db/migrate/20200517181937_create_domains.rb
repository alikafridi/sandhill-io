class CreateDomains < ActiveRecord::Migration[5.1]
  def change
    create_table :domains do |t|
      t.string :domain, unique: true
      t.string :name
      t.string :description
      t.string :logo
      t.integer :year_founded
      t.string :headquarters
      t.string :cover_photo
      t.string :countries
      t.string :status
      t.string :category
      t.string :sub_category
      t.string :tags
      t.string :ancestry
      t.string :comm_platform
      t.integer :alexa_rank
      t.string :funds_raised

      t.timestamps
    end
    add_index :domains, :category
    add_index :domains, :ancestry
  end
end
