class AddReachViewsPerMillionToDomains < ActiveRecord::Migration[5.1]
  def change
    add_column :domains, :reach_views_per_million, :float
  end
end
