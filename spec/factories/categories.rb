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

FactoryBot.define do
  factory :category do
    name "MyString"
    image "MyString"
  end
end
