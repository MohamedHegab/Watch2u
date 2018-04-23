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
    city "MyString"
    country "MyString"
    street_address "MyString"
    floor_no "MyString"
    building_no "MyString"
    lat "MyString"
    lng "MyString"
    user nil
  end
end
