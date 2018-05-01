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

class ProductImage < ApplicationRecord
  attr_accessor :image_contents
	############ Assocciations ###############
  belongs_to :product, inverse_of: :product_images, optional: true

	############ validations #################
	before_validation :parse_image

  has_attached_file :image, styles: { medium: "1000x1000>", small: "400x400>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  private
  def parse_image
    if self.image_contents
    	image = Paperclip.io_adapters.for(image_contents) 
    	image.original_filename = self.image_file_name
    	self.image = image 
    end
  end
end
