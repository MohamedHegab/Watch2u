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

class Category < ApplicationRecord
	attr_accessor :image_content
	############ validations ############
	validates_presence_of :name
	validates :image, attachment_presence: true
	validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes

	############ Assocciations ############
	has_attached_file :image, styles: { medium: "1000x1000>", small: "400x400>" }, default_url: "/images/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	has_many :sub_categories, dependent: :destroy
	accepts_nested_attributes_for :sub_categories
	has_many :products, through: :sub_categories

	############ Callbacks ################
	before_validation :parse_image


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
