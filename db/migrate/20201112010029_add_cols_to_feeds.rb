class AddColsToFeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :feeds, :follow_url, :string
    add_column :feeds, :tags, :string
    add_column :feeds, :description, :string
    add_column :feeds, :default_author, :string
  end
end
