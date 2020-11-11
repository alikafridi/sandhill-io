class AddFieldsToDaycare < ActiveRecord::Migration[5.1]
  def change
    add_column :daycares, :user_owner, :integer
    add_column :daycares, :contact_name, :string
    add_column :daycares, :contact_position, :string
    add_column :daycares, :contact_personal_num, :string
    add_column :daycares, :daycare_license_number, :string
    add_column :daycares, :center_district, :string
    add_column :daycares, :center_fax, :string
    add_column :daycares, :latitude, :float
    add_column :daycares, :longitude, :float
  end
end
