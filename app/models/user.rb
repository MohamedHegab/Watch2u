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
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  ############## Validations #################
  validates_presence_of :first_name, :last_name, :mobile, :code, :gender
  validates_uniqueness_of :mobile, :email
  validates :gender, inclusion: { in: ['male', 'female'] }

  ############## Callbacks #################
  before_create :fix_attributes
  before_update :fix_attributes

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
end
