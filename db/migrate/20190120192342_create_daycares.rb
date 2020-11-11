class CreateDaycares < ActiveRecord::Migration[5.1]
  def change
    create_table :daycares do |t|
      t.string :name
      t.string :address
      t.string :url
      t.string :call_phone
      t.string :text_phone
      t.string :email
      t.string :center_description
      t.string :additional_info
      t.string :yelp_url
      t.string :hours_open
      t.string :days_open
      t.string :ages
      t.string :center_type
      t.string :center_tuition
      t.string :care_type
      t.string :accreditation_type
      t.string :religious_affiliations
      t.string :languages_spoken
      t.boolean :spots_available
      t.string :availability_information
      t.decimal :rating_score
      t.integer :rating_count
      t.string :student_teacher_ratio
      t.string :added_tags

      t.timestamps
    end
  end
end
