class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :founders
      t.integer :year_founded
      t.string :linkedin_url
      t.string :headquarters
      t.integer :combined_alexa
      t.integer :employee_count
      t.string :type
      t.integer :capital_raised

      t.timestamps
    end
  end
end
