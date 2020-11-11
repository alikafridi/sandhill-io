class AddColumnsToDomains < ActiveRecord::Migration[5.1]
  def change
    add_column :domains, :employee_count, :integer
    add_column :domains, :employee_growth, :integer
  end
end
