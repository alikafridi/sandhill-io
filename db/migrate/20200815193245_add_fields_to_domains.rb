class AddFieldsToDomains < ActiveRecord::Migration[5.1]
  def change
    add_column :domains, :platform, :string
    add_column :domains, :alexa_enriched, :datetime
    add_column :domains, :domain_enriched, :datetime
  end
end
