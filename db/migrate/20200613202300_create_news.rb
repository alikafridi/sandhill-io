class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :title
      t.string :article_link
      t.string :description
      t.integer :upvotes
      t.string :tags

      t.timestamps
    end
  end
end
