# == Schema Information
#
# Table name: addresses
#
#  id             :uuid             not null, primary key
#  city           :string
#  country        :string
#  street_address :string
#  floor_no       :string
#  building_no    :string
#  lat            :string
#  lng            :string
#  user_id        :uuid
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :address do
    street_address FFaker::Address.street_address
    floor_no FFaker::Address.building_number
    building_no FFaker::Address.building_number
    lat FFaker::Geolocation.lat
    lng FFaker::Geolocation.lng
    association :user, factory: [:admin]
    region
  end
end
