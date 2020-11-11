class CreateDomainAlexas < ActiveRecord::Migration[5.1]
  def change
    create_table :domain_alexas do |t|
      t.string :domain
      t.integer :alexa_rank

      t.timestamps
    end
  end
end
