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

  has_attached_file :image, styles: { medium: "780x668#", small: "480x880#", big: "1920x1280#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  private 
  def parse_image
  	# byebug
  	image = Paperclip.io_adapters.for(image_contents) 
  	image.original_filename = "image.jpg" 
  	self.image = image 
  end
end
