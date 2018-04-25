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
	enum status: [ :draft, :pending, :dispatched, :delivered ]
	############ validations ############
	validates_presence_of :sub_total, :status, :number, :total_price
	validates :sub_total, :total_price, numericality: { greater_than_or_equal_to: 0 }
	validate :sub_total_check
	validate :user_has_only_one_draft

	############ Assocciations ############
  belongs_to :customer, class_name: 'User', foreign_key: :customer_id
  belongs_to :payment
  has_many :order_products
  has_many :products, through: :order_products
  before_validation :calculate_sub_total
  before_validation :set_status
  before_validation :set_number

  scope :not_draft , -> {where.not(status: :draft)}

	############ Callbacks ############


	########### Validation methods #########
	def sub_total_check
		# check if the sub_total field equals the sum of each product
		if products_cost != self.sub_total
			errors.add(:sub_total, message: 'wrong sub total')
		end
	end

	def user_has_only_one_draft
		if Order.find_by(customer_id: self.customer_id, status: :draft)
			errors.add(:base, message: 'must complete your order first')
		end
	end
	
	############# Calculation methods #########
	def products_cost
		# summes the costs of each product in the order_product table
		order_products.collect(&:q_p_cost).reduce(:+) || 0
	end

	def calculate_sub_total
		# Calculate the subtotal field of the database
		self.sub_total = products_cost || 0
	end

	def set_status
		# this method instead of default in the database
		self.status = :draft
	end
	
	def set_number
		last_this_year_order = Order.find_by('extract(year  from created_at) = ?', Date.today.year)
		if last_this_year_order
			self.number = "#{Date.today.year}_#{last_this_year_order.last.number.next}"
		else
			self.number = "#{Date.today.year}_#{1}"
		end
	end


end
