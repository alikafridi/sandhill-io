class Location < ApplicationRecord
	extend FriendlyId
	has_ancestry

	friendly_id :name, use: :slugged

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

	has_and_belongs_to_many :domains
end
