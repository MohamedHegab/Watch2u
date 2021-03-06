# == Schema Information
#
# Table name: products
#
#  id              :uuid             not null, primary key
#  name            :string           default(""), not null
#  description     :text             default(""), not null
#  price           :float            not null
#  sub_category_id :uuid
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  category_id     :uuid
#  discount        :integer          default(0)
#

RSpec.describe Product, type: :model do
  before { @product = FactoryBot.build(:product) }

  subject { @product }

	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:price) }
	it { should validate_presence_of(:description) }
	it { should belong_to(:category) }
  it { should belong_to(:sub_category) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
	it { should validate_numericality_of(:discount).is_greater_than_or_equal_to(0) }
end
