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

require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
