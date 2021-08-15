class AddNoncoreToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :non_core, :boolean
  end
end
