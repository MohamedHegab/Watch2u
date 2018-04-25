# == Schema Information
#
# Table name: orders
#
#  id          :uuid             not null, primary key
#  sub_total   :float            default(0.0), not null
#  status      :integer
#  number      :string           default("0"), not null
#  total_price :float            default(0.0), not null
#  customer_id :integer
#  payment_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Order < ApplicationRecord
	enum status: [ :pending, :dispatched, :delivered ]
	############ validations ############
	validates_presence_of :sub_total, :status, :number, :total_price
	validates :sub_total, :total_price, numericality: { greater_than_or_equal_to: 0 }
	# validate :sub_total_check

	############ Assocciations ############
  belongs_to :user, foriegn_key: :customer_id
  belongs_to :payment
  has_many :order_products
  has_many :products, through: :order_products

	############ Callbacks ############

	def sub_total_check
		
	end
end
