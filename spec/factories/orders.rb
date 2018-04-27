# == Schema Information
#
# Table name: orders
#
#  id          :uuid             not null, primary key
#  sub_total   :float            default(0.0), not null
#  status      :integer
#  number      :string           default("0"), not null
#  total_price :float            default(0.0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :uuid
#  payment_id  :uuid
#

FactoryBot.define do
  factory :order do
    sub_total 1.5
    status 1
    number ""
    total_price 1.5
    customer nil
    payment nil
  end
end
