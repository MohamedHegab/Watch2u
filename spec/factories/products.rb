# == Schema Information
#
# Table name: products
#
#  id              :uuid             not null, primary key
#  name            :string           default(""), not null
#  description     :text             default(""), not null
#  price           :float            not null
#  discount        :integer
#  sub_category_id :uuid
#  category_id     :uuid
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#

FactoryBot.define do
  factory :product do
    name FFaker::Product.name
    description FFaker::Book.description
    price 1.5
    discount 12
    sub_category
		category
  end
end
