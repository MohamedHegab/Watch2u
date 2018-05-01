# == Schema Information
#
# Table name: order_products
#
#  id         :uuid             not null, primary key
#  order_id   :uuid
#  product_id :uuid
#  price      :float            default(0.0), not null
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderProduct < ApplicationRecord
	attr_accessor :discount, :new_price, :total_price
	############ validations ############
	validates_presence_of :quantity
	validates :quantity, :price, numericality: { greater_than_or_equal_to: 0 }
	# validate :product_is_present
	
	############ Assocciations ############
  belongs_to :order, inverse_of: :order_products
  belongs_to :product

	############ Callbacks ############
  before_save :get_price_from_product

  # def product_is_present
  # 	unless Product.find(self.product_id)
		# 	errors.add(:base, 'There is no product with that id')
  # 	end
  # end

	def q_p_cost
		cost = self.quantity * self.price
		return (cost - (cost * product.discount/100))
	end

	def get_price_from_product
		self.price = product.price
	end

	def calculate_sub_total_for_order
		order.calculate_sub_total
	end
end
