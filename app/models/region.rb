# == Schema Information
#
# Table name: regions
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Region < ApplicationRecord
	############ validations ############
	validates_presence_of :name

	has_many :users
	has_many :addresses
end
