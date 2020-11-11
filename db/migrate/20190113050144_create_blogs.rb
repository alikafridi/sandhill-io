class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.text :title
      t.text :content
      t.text :author
      t.text :date
      t.text :image
      t.text :tags

      t.timestamps
    end
  end
end
