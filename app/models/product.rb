# == Schema Information
#
# Table name: products
#
#  id              :uuid             not null, primary key
#  name            :string           default(""), not null
#  description     :text             default(""), not null
#  price           :float            not null
#  discount        :integer
#  sub_category_id :uuid
#  category_id     :uuid
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#

class Product < ApplicationRecord
	############ validations #################
	validates_presence_of :name, :price, :description
	validates :price, :discount, numericality: { greater_than_or_equal_to: 0 }
	############ Assocciations ###############
  belongs_to :sub_category
  # belongs_to :category

  extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]

	private

	def should_generate_new_friendly_id?
	  slug.nil? || name_changed?
	end
end
