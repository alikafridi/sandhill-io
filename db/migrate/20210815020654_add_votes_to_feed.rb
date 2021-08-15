class AddVotesToFeed < ActiveRecord::Migration[5.1]
  def change
    add_column :feeds, :votes, :integer
  end
end
