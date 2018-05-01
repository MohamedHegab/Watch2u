RSpec.describe Api::V1::ProductsController, type: :controller do
	describe "GET #show" do
    before(:each) do
      admin = FactoryBot.create :admin
      api_authorize(admin.auth_token)
      @product = FactoryBot.create :product
      get :show, params: { category_id: @product.category_id, sub_category_id: @product.sub_category_id, id: @product.id }
    end

    it "returns the information about the product on a hash" do
      product_response = json_response
      expect(product_response[:data][:name]).to eql @product.name
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
      	admin = FactoryBot.create :admin
	      api_authorize(admin.auth_token)
	      sub_category = FactoryBot.create :sub_category
        @product_attributes = FactoryBot.attributes_for(:product).merge({category_id: sub_category.category_id, sub_category_id: sub_category.id})
        post :create, params: { category_id: sub_category.category_id, sub_category_id: sub_category.id,  product: @product_attributes }
      end

      it "renders the json representation for the user record just created" do
        product_response = json_response
        expect(product_response[:data][:name]).to eql @product_attributes[:name]
      end

      it { should respond_with 201 }
    end

    context "when is not created not valid attributes" do
      before(:each) do
        admin = FactoryBot.create :admin
	      api_authorize(admin.auth_token)
	      sub_category = FactoryBot.create :sub_category
        @invalid_product_attributes = { name: nil }
        post :create, params: { category_id: sub_category.category.id, sub_category_id: sub_category.id, product: @invalid_product_attributes }
      end

      it "renders an errors json" do
        product_response = json_response
        expect(product_response).to have_key(:code)
      end

      it "renders the json errors on why the product could not be created" do
        product_response = json_response
        expect(product_response[:data][:validation_errors][0][:messages][0]).to include "can't be blank"
      end

      it { should respond_with 200 }
    end

    context "when is not created has no authorization" do
      before(:each) do
      	customer = FactoryBot.create :customer
	      api_authorize(customer.auth_token)
	      sub_category = FactoryBot.create :sub_category
        @product_attributes = FactoryBot.attributes_for :product
        post :create, params: { category_id: sub_category.category.id,sub_category_id: sub_category.id, product: @product_attributes }
      end

      it "renders a not authorized message" do
        product_response = json_response
        expect(product_response[:message]).to include("Don't have authorization")
      end

      it { should respond_with 200 }
    end


  end

  describe "PUT/PATCH #update" do

    context "when is successfully updated" do
      before(:each) do
        admin = FactoryBot.create :admin
        api_authorize(admin.auth_token)
        @product = FactoryBot.create :product
        @name = 'female'
        patch :update, params: { category_id: @product.category_id,sub_category_id: @product.sub_category.id, id: @product.id,
                         product: { name: @name } }
      end

      it "renders the json representation for the updated user" do
        product_response = json_response
        expect(product_response[:data][:name]).to eql @name
      end

      it { should respond_with 200 }
    end

    context "when is not created not valid name" do
      before(:each) do
      	admin = FactoryBot.create :admin
        api_authorize(admin.auth_token)
        @product = FactoryBot.create :product
        patch :update, params: { category_id: @product.category_id, sub_category_id: @product.sub_category.id, id: @product.id,
                         product: { name: nil } }
      end

      it "renders an errors json" do
        product_response = json_response
        expect(product_response).to have_key(:code)
      end

      it "renders the json errors on why the product could not be created" do
        product_response = json_response
        expect(product_response[:data][:validation_errors][0][:messages][0]).to include "can't be blank"
      end

      it { should respond_with 200 }
    end

    context "when is not created has no authorization" do
      before(:each) do
      	customer = FactoryBot.create :customer
        api_authorize(customer.auth_token)
        @product = FactoryBot.create :product
        patch :update, params: { category_id: @product.category_id,sub_category_id: @product.sub_category_id, id: @product.id,
                         product: { name: 'good' } }
      end

      it "renders a not authorized message" do
        category_response = json_response
        expect(category_response[:message]).to include("Don't have authorization")
      end

      it { should respond_with 200 }
    end
  end

  describe "DELETE #destroy" do
    context "can destroy product when admin" do 
      before(:each) do
        admin = FactoryBot.create :admin
        api_authorize(admin.auth_token)
        @product = FactoryBot.create :product
      end
      it "" do
        expect {
          delete :destroy, params: {category_id: @product.category_id,sub_category_id: @product.sub_category_id, id: @product.id}
        }.to change(Product, :count).by(-1)
      end
    end
    context "can't destroy the category when sales" do 
      before(:each) do 
        sales = FactoryBot.create :sales
        @product = FactoryBot.create :product
        api_authorize(sales.auth_token)
        delete :destroy, params: {category_id: @product.category_id,sub_category_id: @product.sub_category_id, id: @product.id}
      end
      it "" do 
        category_response = json_response
        expect(category_response[:message]).to include("Don't have authorization")
      end
    end
  end
end
