class AddMoreFieldsToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :publisher_description, :string
    add_column :news, :slug, :string
    add_index :news, :slug, unique: true
  end
end
