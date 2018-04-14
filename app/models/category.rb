class Category < ApplicationRecord
	############ validations ############
	validates_presence_of :name

	############ Assocciations ############
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	has_many :sub_categories, dependent: :destroy
	has_many :products, through: :sub_categories

	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]


	private

	def should_generate_new_friendly_id?
	  slug.nil? || name_changed?
	end

end
