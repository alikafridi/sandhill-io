class AddNoninvestorToFeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :feeds, :non_investor, :boolean
  end
end
