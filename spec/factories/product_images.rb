# == Schema Information
#
# Table name: product_images
#
#  id                 :uuid             not null, primary key
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  product_id         :uuid
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
  factory :product_image do
    image ""
    product nil
  end
end
