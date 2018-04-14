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
  attr_accessor :role_input
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  ############## Validations #################
  validates_presence_of :first_name, :last_name, :mobile, :code, :gender
  validates_uniqueness_of :mobile, :email
  validates :auth_token, uniqueness: true
  validates :gender, inclusion: { in: ['male', 'female'] }
  enumerize :role_input, in: {customer: 0, sales: 1, admin: 2}, scope: true

  ############## Callbacks #################
  before_create :fix_attributes
  before_update :fix_attributes
  before_create :assign_role

  ############## Methods #################

  def fix_attributes
    self.email = trim_string(self.email.downcase, true)
    self.first_name = trim_string(self.first_name)
    self.last_name = trim_string(self.last_name)
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
end
