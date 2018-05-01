class Api::V1::AddressesController < Api::BaseController
	respond_to :json
  before_action :authenticate_with_token!
	load_and_authorize_resource
	
  before_action :set_address, only: [:show, :update, :destroy]

  def index
  	page_size = params[:page_size]
    @q = current_user.addresses.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.empty?

    @addresses = @q.result.page(page_size)
    render_success(:index, :ok, nil, @addresses)
  end
	
	def show
    render_success(:show, :ok, nil, @address)
	end

	def update
		if @address.update(address_params)
      render_success(:show, :ok, nil, @address)
    else
      render_validation_error(:show, validation_message_maker(@address), 8000)
    end
	end

	def create
	  @address = current_user.addresses.create(address_params)
    if @address.valid? && @address.save
      render_success(:show, :created, nil, @address)
    else
      render_validation_error(:show, validation_message_maker(@address), 8000)
    end
	end

	def destroy
		@address.destroy
    if @address.destroy
      render_success(:show, :deleted)
    else
      render_validation_error(:show, validation_message_maker(@address), 8000)
    end
	end

	private

	def set_address
		@address = current_user.addresses.find(params[:id])
	end

	def address_params
	  params.require(:address).permit(:street_address, :floor_no, :building_no, :lat, :lng)
	end
end
