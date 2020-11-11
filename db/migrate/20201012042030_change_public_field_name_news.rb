class ChangePublicFieldNameNews < ActiveRecord::Migration[5.1]
  def change
    remove_column :news, :public
    add_column :news, :publish, :boolean
  end
end