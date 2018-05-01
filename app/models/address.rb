# == Schema Information
#
# Table name: addresses
#
#  id             :uuid             not null, primary key
#  country        :string
#  street_address :string
#  floor_no       :string
#  building_no    :string
#  lat            :string
#  lng            :string
#  user_id        :uuid
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  region_id      :uuid
#

class Address < ApplicationRecord
	############ validations ############
	validates_presence_of :lat, :lng, :street_address

	############ Assocciations ############
  belongs_to :user, inverse_of: :addresses
  belongs_to :region
  has_many :orders

	############ Callbacks ############
  before_validation :set_region_from_user

  def set_region_from_user
  	self.region = self.user.region
  end
end
