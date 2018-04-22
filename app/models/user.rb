# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  region                 :string
#  address                :string
#  gender                 :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  mobile                 :string
#  code                   :string
#  verification_code      :string
#  is_mobile_verified     :boolean          default(FALSE)
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  auth_token             :string
#

class User < ApplicationRecord
  extend Enumerize
  rolify
  attr_accessor :role_input, :image_content
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  ############## Validations #################
  validates_presence_of :first_name, :last_name, :mobile, :code, :gender
  validates_presence_of :role_input, on: :create
  validates_uniqueness_of :mobile, :email
  validates :auth_token, uniqueness: true
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes

  ############## ENUM ########################  
  enumerize :gender, in: {male: 0, female: 1}, scope: true
  enumerize :role_input, in: {customer: 0, sales: 1, admin: 2}, scope: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  has_many :addresses
  belongs_to :region
  accepts_nested_attributes_for :region, :addresses

  ############## Callbacks #################
  before_validation :parse_image
  before_create :fix_attributes
  before_update :fix_attributes
  before_create :assign_role

  ###### for testing remove in production
  after_create :confirm_user 
  ########
  def confirm_user
    self.confirm
  end
  #########

  ############## Methods #################

  def fix_attributes
    self.email = trim_string(self.email.downcase, true)
    self.first_name = trim_string(self.first_name)
    self.last_name = trim_string(self.last_name)
    generate_authentication_token!
  end

  def username
  	"#{first_name}_#{last_name}"
  end

  def trim_string st, all = nil
    if all.nil?
      st = st.gsub(/ +/, " ")
    else
      st = st.gsub(/\s+/, "")
    end
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def assign_role
    if self.role_input && !self.has_role?(self.role_input)
      self.add_role role_input
    end
  end

  ######## reset password mehtods ###############
  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end
  ################################################

  def parse_image
    image = Paperclip.io_adapters.for(self.image_content) 
    image.original_filename = self.image_file_name
    self.image = image 
  end
end
