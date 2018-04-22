class Region < ApplicationRecord
	############ validations ############
	validates_presence_of :name

	has_many :users
end
