class AddDateToLinkedinCounts < ActiveRecord::Migration[5.1]
  def change
    add_column :linkedin_counts, :date, :datetime
  end
end
