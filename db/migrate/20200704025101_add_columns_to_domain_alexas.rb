class AddColumnsToDomainAlexas < ActiveRecord::Migration[5.1]
  def change
    add_column :domain_alexas, :date, :datetime
    add_column :domain_alexas, :reach_rank_value, :integer
    add_column :domain_alexas, :reach_per_million_value, :decimal
    add_column :domain_alexas, :page_views_rank_value, :integer
    add_column :domain_alexas, :page_views_per_million_value, :decimal
    add_column :domain_alexas, :page_views_per_user_value, :decimal
  end
end
