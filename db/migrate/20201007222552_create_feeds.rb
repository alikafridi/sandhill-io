class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :url
      t.boolean :auto_public

      t.timestamps
    end
  end
end
