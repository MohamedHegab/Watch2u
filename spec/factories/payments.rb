# == Schema Information
#
# Table name: payments
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :payment do
    name "MyString"
  end
end
