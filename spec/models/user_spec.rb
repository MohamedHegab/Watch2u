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

describe User do
  before { @user = FactoryBot.build(:admin) }

  subject { @user }

	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:first_name) }
	it { should validate_presence_of(:last_name) }
	it { should validate_presence_of(:gender) }
	it { should validate_presence_of(:mobile) }

	it { should validate_uniqueness_of(:email).case_insensitive }
	it { should validate_uniqueness_of(:mobile).case_insensitive }
  it { should validate_uniqueness_of(:auth_token) }
	it { should validate_confirmation_of(:password) }
  it { should respond_to(:auth_token) }
  it { should validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif', 'image/jpeg', 'image/jpg').
                rejecting('text/plain', 'text/xml') }
  # it { should validate_attachment_size(:image).
  #               less_than(2.megabytes) }
	it { expect(@user.username).to eql "#{@user.first_name}_#{@user.last_name}" }

	describe "#generate_authentication_token!" do
    it "generates a unique token" do
      allow(Devise).to receive(:friendly_token).and_return("auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).to eql "auniquetoken123"
    end

    it "generates another token when one already has been taken" do
      existing_user = FactoryBot.create(:admin, auth_token: "auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eql existing_user.auth_token
    end
  end
end
