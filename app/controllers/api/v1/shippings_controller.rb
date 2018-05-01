class Api::V1::ShippingsController < Api::BaseController
	respond_to :json
  before_action :authenticate_with_token!
	load_and_authorize_resource
	
  before_action :set_shipping, only: [:show, :update, :destroy]

  def index
		page_size = params[:page_size]
    @q = Shipping.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.empty?

    @shippings = @q.result.page(page_size)
    render_success(:index, :ok, nil, @shippings)
	end

	def show
    render_success(:show, :ok, nil, @shipping)
	end

	def update
		if @shipping.update(shipping_params)
      render_success(:show, :ok, nil, @shipping)
    else
      render_validation_error(:show, validation_message_maker(@shipping), 8000)
    end
	end

	def create
	  @shipping = Shipping.create(shipping_params)
    if @shipping.valid? && @shipping.save
      render_success(:show, :created, nil, @shipping)
    else
      render_validation_error(:show, validation_message_maker(@shipping), 8000)
    end
	end

	def destroy
		@shipping.destroy
    if @shipping.destroy
      render_success(:show, :deleted)
    else
      render_validation_error(:show, validation_message_maker(@shipping), 8000)
    end
	end

	private

	def set_shipping
		@shipping = Shipping.find(params[:id])
	end

	def shipping_params
	  params.require(:shipping).permit(:name, :fees)
	end
end
