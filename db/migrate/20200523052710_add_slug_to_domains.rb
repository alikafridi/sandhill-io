class AddSlugToDomains < ActiveRecord::Migration[5.1]
  def change
    add_column :domains, :slug, :string
    add_index :domains, :slug, unique: true
  end
end
