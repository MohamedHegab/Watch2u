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
	############ validations ############
	validates_presence_of :quantity, :price
	validates :quantity, :price, numericality: { greater_than_or_equal_to: 0 }
	
	############ Assocciations ############
  belongs_to :order, inverse_of: :order_products
  belongs_to :product

	############ Callbacks ############


	def q_p_cost
		self.quantity * self.price
	end
end
