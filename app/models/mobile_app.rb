class MobileApp < ApplicationRecord
	has_and_belongs_to_many :categories

	extend FriendlyId
  friendly_id :name, use: :slugged
	belongs_to :company, optional: true

	validates :name, presence: true
	validates :ios_sensortower_link, uniqueness: true, allow_blank: true
	validates :android_sensortower_link, uniqueness: true, allow_blank: true

	has_many :app_datum
end
