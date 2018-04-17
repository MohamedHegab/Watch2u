RSpec.describe Api::V1::CategoriesController, type: :controller do
	describe "GET #show" do
    before(:each) do
      admin = FactoryBot.create :admin
      api_authorize(admin.auth_token)
      @category = FactoryBot.create :category
      get :show, params: { id: @category.id }
    end

    it "returns the information about the category on a hash" do
      category_response = json_response
      expect(category_response[:data][:name]).to eql @category.name
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
      	admin = FactoryBot.create :admin
	      api_authorize(admin.auth_token)
        @category_attributes = FactoryBot.attributes_for :category
        post :create, params: { category: @category_attributes }
      end

      it "renders the json representation for the user record just created" do
        category_response = json_response
        expect(category_response[:data][:name]).to eql @category_attributes[:name]
      end

      it { should respond_with 201 }
    end

    context "when is not created not valid attributes" do
      before(:each) do
        admin = FactoryBot.create :admin
	      api_authorize(admin.auth_token)
        @invalid_category_attributes = { name: nil }
        post :create, params: { category: @invalid_category_attributes }
      end

      it "renders an errors json" do
        category_response = json_response
        expect(category_response).to have_key(:code)
      end

      it "renders the json errors on why the category could not be created" do
        category_response = json_response
        expect(category_response[:data][:validation_errors][0][:messages][0]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end

    context "when is not created has no authorization" do
      before(:each) do
      	customer = FactoryBot.create :customer
	      api_authorize(customer.auth_token)
        @category_attributes = FactoryBot.attributes_for :category
        post :create, params: { category: @category_attributes }
      end

      it "renders a not authorized message" do
        category_response = json_response
        expect(category_response[:message]).to include("Don't have authorization")
      end

      it { should respond_with 200 }
    end


  end

  describe "PUT/PATCH #update" do

    context "when is successfully updated" do
      before(:each) do
        admin = FactoryBot.create :admin
        api_authorize(admin.auth_token)
        @category = FactoryBot.create :category
        @name = 'female'
        patch :update, params: { id: @category.id,
                         category: { name: @name } }
      end

      it "renders the json representation for the updated user" do
        category_response = json_response
        expect(category_response[:data][:name]).to eql @name
      end

      it { should respond_with 200 }
    end

    context "when is not created not valid name" do
      before(:each) do
      	admin = FactoryBot.create :admin
        api_authorize(admin.auth_token)
        @category = FactoryBot.create :category
        patch :update, params: { id: @category.id,
                         category: { name: nil } }
      end

      it "renders an errors json" do
        category_response = json_response
        expect(category_response).to have_key(:code)
      end

      it "renders the json errors on why the category could not be created" do
        category_response = json_response
        expect(category_response[:data][:validation_errors][0][:messages][0]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end

    context "when is not created has no authorization" do
      before(:each) do
      	customer = FactoryBot.create :customer
        api_authorize(customer.auth_token)
        @category = FactoryBot.create :category
        patch :update, params: { id: @category.id,
                         category: { name: 'good' } }
      end

      it "renders a not authorized message" do
        category_response = json_response
        expect(category_response[:message]).to include("Don't have authorization")
      end

      it { should respond_with 200 }
    end

  end
end
