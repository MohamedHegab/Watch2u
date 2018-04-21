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
    name "MyString"
    description "MyText"
    price 1.5
    discount 1
    sub_category nil
    sub_category_category nil
  end
end
