class Daycare < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

end