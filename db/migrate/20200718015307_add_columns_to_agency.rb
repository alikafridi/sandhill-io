class AddColumnsToAgency < ActiveRecord::Migration[5.1]
  def change
    add_column :agencies, :linkedin_url, :string
    add_column :agencies, :employee_count, :integer
    add_column :agencies, :description, :string
    add_column :agencies, :year_founded, :integer
  end
end
