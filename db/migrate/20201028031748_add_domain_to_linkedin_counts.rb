class AddDomainToLinkedinCounts < ActiveRecord::Migration[5.1]
  def change
    add_column :linkedin_counts, :domain, :string
  end
end
