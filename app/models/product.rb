# == Schema Information
#
# Table name: products
#
#  id              :uuid             not null, primary key
#  name            :string           default(""), not null
#  description     :text             default(""), not null
#  price           :float            not null
#  sub_category_id :uuid
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  category_id     :uuid
#  discount        :integer          default(0)
#

class Product < ApplicationRecord
	attr_accessor :product_image_data
	############ validations #################
	validates_presence_of :name, :price, :description
	validates :price, :discount, numericality: { greater_than_or_equal_to: 0 }

	############ Assocciations ###############
  belongs_to :sub_category, inverse_of: 'products'
  belongs_to :category
  has_many :product_images, dependent: :destroy
  has_many :order_products
  has_many :orders, through: :order_products
  accepts_nested_attributes_for :product_images

  extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]

	def save_attachments(params) 
		params[:product_image_data].each do |doc| 
			self.product_images.build(image_contents: doc['image_content'], image_file_name: doc['image_file_name'])
		end
	end

	def new_price
		if price
			price - (price * (discount||0)/100)
		end
	end

	private

	def should_generate_new_friendly_id?
	  slug.nil? || name_changed?
	end
end
