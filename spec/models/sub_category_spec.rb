# == Schema Information
#
# Table name: sub_categories
#
#  id                 :uuid             not null, primary key
#  name               :string           default(""), not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  category_id        :uuid
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  slug               :string
#

RSpec.describe SubCategory, type: :model do
  before { @sub_category = FactoryBot.build(:sub_category) }

  subject { @sub_category }

	it { should validate_presence_of(:name) }
	it { should belong_to(:category) }
  it { should have_many(:products).dependent(:destroy) }
  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it { should validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif', 'image/jpeg', 'image/jpg').
                rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:image).
                less_than(2.megabytes) }
end
