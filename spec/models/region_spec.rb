# == Schema Information
#
# Table name: regions
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Region, type: :model do
  before { @region = FactoryBot.build(:region) }

  subject { @region }

	it { should validate_presence_of(:name) }
end
