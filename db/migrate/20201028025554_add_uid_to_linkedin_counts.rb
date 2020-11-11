class AddUidToLinkedinCounts < ActiveRecord::Migration[5.1]
  def change
    add_column :linkedin_counts, :uid, :string
  end
end
