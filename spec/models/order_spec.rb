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

require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
