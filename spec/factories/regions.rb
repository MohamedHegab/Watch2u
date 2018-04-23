# == Schema Information
#
# Table name: regions
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :region do
    name FFaker::Address.city
  end
end
