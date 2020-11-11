class AddFieldsToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :slug, :string
    add_index :blogs, :slug, unique: true
    add_column :blogs, :highlight, :string
  end
end
