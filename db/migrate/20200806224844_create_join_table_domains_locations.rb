class CreateJoinTableDomainsLocations < ActiveRecord::Migration[5.1]
  def change
    create_join_table :domains, :locations do |t|
       t.index [:domain_id, :location_id]
       t.index [:location_id, :domain_id]
    end
  end
end
