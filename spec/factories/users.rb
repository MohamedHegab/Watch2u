# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  gender                 :string           default(NULL), not null
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
#  image_file_name        :string
#  image_content_type     :string
#  image_file_size        :integer
#  image_updated_at       :datetime
#  region_id              :uuid
#

FactoryBot.define do
  factory :user do
    email FFaker::Internet.email
    first_name FFaker::Name.first_name
    last_name FFaker::Name.last_name
    password 'MyPassword123'
    password_confirmation 'MyPassword123'
    mobile FFaker::PhoneNumberAU.mobile_phone_number
    code FFaker::PhoneNumberAU.country_code
    gender 0
    region
    auth_token "ourToken"
    factory :admin do
        after(:build) do |user|
            user.role_input = "admin"
        end
    end

    factory :sales do
        after(:build) do |user| 
            user.role_input = "sales"
        end
    end

    factory :customer do
        after(:build) do |user| 
            user.role_input = "sales"
        end
    end
  end
end
