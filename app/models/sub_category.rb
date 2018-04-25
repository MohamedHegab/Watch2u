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

class SubCategory < ApplicationRecord
	attr_accessor :image_content

	############ validations ############
	before_validation :parse_image

	validates_presence_of :name
	validates :image, attachment_presence: true
	validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes

	############ Assocciations ############
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :category
  has_many :products, dependent: :destroy
	accepts_nested_attributes_for :products

  extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]

	private

	def should_generate_new_friendly_id?
	  slug.nil? || name_changed?
	end

	def parse_image
		if self.image_content
	  	image = Paperclip.io_adapters.for(self.image_content) 
	  	image.original_filename = self.image_file_name
	  	self.image = image 
	  end
  end
end
