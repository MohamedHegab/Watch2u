# == Schema Information
#
# Table name: orders
#
#  id          :uuid             not null, primary key
#  sub_total   :float            default(0.0), not null
#  status      :integer
#  number      :string           default("0"), not null
#  total_price :float            default(0.0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :uuid
#  payment_id  :uuid
#

class Order < ApplicationRecord
	enum status: { draft: 0 , pending: 1, dispatched: 2, delivered: 3, canceled: 4 }
	############ validations ############
	validates :sub_total, :total_price, numericality: { greater_than_or_equal_to: 0 }
	validate :sub_total_check
	validate :user_has_only_one_draft
	validate :address_is_for_same_customer

	############ Assocciations ############
  belongs_to :customer, class_name: 'User', inverse_of: :orders, foreign_key: :customer_id
  belongs_to :payment, optional: true
  belongs_to :address, optional: true
	belongs_to :shipping, optional: true
  has_many :order_products, inverse_of: :order, dependent: :destroy
  has_many :products, through: :order_products
  accepts_nested_attributes_for :order_products

  ########### Callbacks #################
  before_create :set_status
  before_create :set_number

  scope :not_draft , -> {where.not(status: :draft)}

	########### Validation methods #########
	def sub_total_check
		# check if the sub_total field equals the sum of each product
		if products_cost != self.sub_total
			errors.add(:sub_total, 'wrong sub total')
		end
	end

	def user_has_only_one_draft
		Order.where(status: :pending)
		if Order.where(customer_id: self.customer_id, status: :draft).reject{|p| p.id == self.id}.any?
			errors.add(:base, 'must complete your order first')
		end
	end

	def address_is_for_same_customer
		if self.address_id
			unless customer.addresses.find_by(id: self.address_id)
				errors.add(:address_id, 'this address is not for you')
			end
		end
	end

	############# Calculation methods #########
	def products_cost
		# summes the costs of each product in the order_product table
		cost = order_products.collect(&:q_p_cost).reduce(:+) || 0
		return cost.round(3)
	end

	def calculate_sub_total_and_total
		# Calculate the subtotal field of the database from the order_product Model
		if self.shipping_id.nil?
			shipping_cost = 0
		else
			shipping_cost = self.shipping.fees.to_f
		end
		sub_total_cost = products_cost || 0
		self.update(sub_total: sub_total_cost, total_price: (sub_total_cost + shipping_cost) )
	end

	def set_status
		# this method instead of default in the database
		self.status = :draft
	end
	
	def set_number
		last_this_year_order = Order.where('extract(year  from created_at) = ?', Date.today.year)
		if last_this_year_order.any?
			self.number = "#{last_this_year_order.last.number.next}"
		else
			self.number = "#{Date.today.year}_#{1}"
		end
	end

	def name
		"#{number}"
	end
end
