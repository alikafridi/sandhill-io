class CreateJoinTableNewsCategories < ActiveRecord::Migration[5.1]
  def change
  	create_join_table :categories, :news do |t|
       t.index [:category_id, :news_id]
       t.index [:news_id, :category_id]
    end
  end
end