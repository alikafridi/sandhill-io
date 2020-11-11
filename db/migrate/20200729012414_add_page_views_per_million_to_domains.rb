class AddPageViewsPerMillionToDomains < ActiveRecord::Migration[5.1]
  def change
    add_column :domains, :page_views_per_million, :float
  end
end
