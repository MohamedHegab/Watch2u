# == Schema Information
#
# Table name: addresses
#
#  id             :uuid             not null, primary key
#  country        :string
#  street_address :string
#  floor_no       :string
#  building_no    :string
#  lat            :string
#  lng            :string
#  user_id        :uuid
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  region_id      :uuid
#

RSpec.describe Address, type: :model do
  before { @address = FactoryBot.build(:address) }

  subject { @address }

	it { should validate_presence_of(:street_address) }

  it { should belong_to(:user) }
  it { should belong_to(:region) }

end
