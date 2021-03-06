describe Api::V1::SessionsController do

  describe "POST #create" do

    before(:each) do
      @user = FactoryBot.create :admin
      @user.confirm
    end

    context "when the credentials are correct" do

      before(:each) do
        credentials = { email: @user.email, password: "MyPassword123", role_input: 'admin' }
        post :create, params:{ user: credentials }
      end

      it "returns the user record corresponding to the given credentials" do
        @user.reload
        expect(json_response[:data][:auth_token]).to eql @user.auth_token
      end

      it { should respond_with 200 }
    end

    context "when the credentials are incorrect" do

      before(:each) do
        credentials = { email: @user.email, password: "invalidpassword" }
        post :create, params: { user: credentials }
      end

      it "returns a json with an error" do
        expect(json_response[:message]).to eql "invalid email or password"
      end

      it { should respond_with 200 }
    end
  end
end
