class Category < ApplicationRecord
	extend FriendlyId
	has_ancestry

	has_many :domain_categories
	has_many :domains, through: :domain_categories
	accepts_nested_attributes_for :domain_categories

	has_many :companies
	has_and_belongs_to_many :agencies
	has_and_belongs_to_many :mobile_apps

	friendly_id :name, use: :slugged

end