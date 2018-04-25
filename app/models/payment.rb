# == Schema Information
#
# Table name: payments
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Payment < ApplicationRecord
	############ validations #################
	validates_presence_of :name

	############ Assocciations ###############
	has_many :orders
end
