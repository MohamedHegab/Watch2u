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

FactoryBot.define do
  factory :sub_category do
    name FFaker::Name.first_name
    image { fixture_file_upload "#{Rails.root}/spec/fixtures/images/product.png", 'image/png' }
    category
  end
end
