class Product < ApplicationRecord
	############ validations #################
	validates_presence_of :name, :price, :description
	validates :price, :discount, numericality: { greater_than: 0 }
	############ Assocciations ###############
  belongs_to :sub_category
  belongs_to :category

  extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]

	private

	def should_generate_new_friendly_id?
	  slug.nil? || name_changed?
	end
end
