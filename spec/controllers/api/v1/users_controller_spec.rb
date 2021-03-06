describe Api::V1::UsersController, type: :controller do
  describe "GET #show" do
    before(:each) do
      @user = FactoryBot.create :admin
      api_authorize(@user.auth_token)
      get :show, params: { id: @user.id }
    end

    it "returns the information about a reporter on a hash" do
      user_response = json_response
      expect(user_response[:data][:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
        region = FactoryBot.create(:region) 
        @user_attributes = FactoryBot.attributes_for(:admin).merge(role_input: 'admin').merge(region: FactoryBot.attributes_for(:region, id: region.id))
        post :create, params: { user: @user_attributes }
      end

      it "renders the json representation for the user record just created" do
        user_response = json_response
        expect(user_response[:data][:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        #notice I'm not including the email
        @invalid_user_attributes = { password: "12345678",
                                     password_confirmation: "12345678" }
        post :create, params: { user: @invalid_user_attributes }
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response).to have_key(:code)
      end

      it "renders the json errors on why the user could not be created" do
        user_response = json_response
        expect(user_response[:data][:validation_errors][0][:messages][0]).to include "can't be blank"
      end

      it { should respond_with 200 }
    end
  end

  describe "PUT/PATCH #update" do

    context "when is successfully updated" do
      before(:each) do
        @user = FactoryBot.create :admin
        api_authorize(@user.auth_token)
        @gender = 0
        patch :update, params: { id: @user.id,
                         user: { gender: @gender } }
      end

      it "renders the json representation for the updated user" do
        user_response = json_response
        expect(user_response[:data][:gender]).to eql @gender
      end

      it { should respond_with 200 }
    end

    context "when is not created" do
      before(:each) do
        @user = FactoryBot.create :admin
        api_authorize(@user.auth_token)
        patch :update, params: { id: @user.id,
                         user: { gender: "ss" } }
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response).to have_key(:code)
      end

      it "renders the json errors on whye the user could not be created" do
        user_response = json_response
        expect(user_response[:data][:validation_errors][0][:messages][0]).to include "not included in the list"
      end

      it { should respond_with 200 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = FactoryBot.create :admin
      api_authorize(@user.auth_token)
    end
    it "destroys the requested user" do
      expect {
        delete :destroy, params: {id: @user.id}
      }.to change(User, :count).by(-1)
    end
  end
end
