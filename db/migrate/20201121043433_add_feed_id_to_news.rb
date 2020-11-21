class AddFeedIdToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :feed_id, :integer
  end
end
