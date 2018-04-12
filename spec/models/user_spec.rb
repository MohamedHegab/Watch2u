describe User do
  before { @user = FactoryBot.build(:user) }

  subject { @user }

	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:first_name) }
	it { should validate_presence_of(:last_name) }
	it { should validate_presence_of(:gender) }
	it { should validate_presence_of(:mobile) }
	it { should validate_uniqueness_of(:email).case_insensitive }
	it { should validate_uniqueness_of(:mobile).case_insensitive }
	it { should validate_confirmation_of(:password) }
	it { expect(@user.username).to eql "#{@user.first_name}_#{@user.last_name}" }
end
