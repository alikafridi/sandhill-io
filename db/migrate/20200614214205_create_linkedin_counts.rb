class CreateLinkedinCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :linkedin_counts do |t|
      t.integer :company_id
      t.integer :employee_count

      t.timestamps
    end
  end
end
