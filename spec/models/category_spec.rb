# == Schema Information
#
# Table name: categories
#
#  id                 :uuid             not null, primary key
#  name               :string           default(""), not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  slug               :string
#

RSpec.describe Category, type: :model do
	before { @category = FactoryBot.build(:category) }

  subject { @category }

	it { should validate_presence_of(:name) }
  it { should have_attached_file(:image) }
  it { should have_many(:sub_categories).dependent(:destroy) }
  it { should have_many(:products).through(:sub_categories) }
  it { should validate_attachment_presence(:image) }
  it { should validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif', 'image/jpeg', 'image/jpg').
                rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:image).
                less_than(2.megabytes) }
end
