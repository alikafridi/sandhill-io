class AddNfieldsToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :feed_description, :string
    add_column :news, :feed_url, :string
  end
end
