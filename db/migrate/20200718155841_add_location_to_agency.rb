class AddLocationToAgency < ActiveRecord::Migration[5.1]
  def change
    add_column :agencies, :location, :string
  end
end
