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

require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
