class Api::V1::AddressController < Api::BaseController
	respond_to :json
  before_action :authenticate_with_token!
	load_and_authorize_resource
	
  before_action :set_address, only: [:show, :update, :destroy]

  def index
  	@addresses = Address.all
  end
	
	def show
		
	end

	def create

	end

	def update

	end

	def destroy

	end

	private

	def set_address
		@address = Address.find(params[:id])
	end
end
