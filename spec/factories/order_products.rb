# == Schema Information
#
# Table name: order_products
#
#  id         :uuid             not null, primary key
#  order_id   :uuid
#  product_id :uuid
#  price      :float            default(0.0), not null
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :order_product do
    order nil
    product nil
    price 1.5
  end
end
