class Shipping < ApplicationRecord
	############ validations ############
	validates_presence_of :name
	validates :fees, numericality: { greater_than_or_equal_to: 0 }

	############ Callbacks ############
	has_many :orders
end
