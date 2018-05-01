class Api::V1::OrdersController < Api::BaseController
  include OrderUpdateWithParams

	respond_to :json
  before_action :authenticate_with_token!
	load_and_authorize_resource
	
  before_action :set_order, only: [:show, :update, :destroy]

  def index
		page_size = params[:page_size]
    @q = Order.not_draft.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.empty?

    @orders = @q.result.page(page_size)
    render_success(:index, :ok, nil, @orders)
	end

	def show
    render_success(:show, :ok, nil, @order)
	end

	def update
    if params[:order][:payment]
      payment = Payment.find(params[:order][:payment][:id]) 
      @order.payment = payment
    end

    if params[:order][:shipping]
      shipping = Shipping.find(params[:order][:shipping][:id]) 
      @order.shipping = shipping
    end

    if params[:order][:address]
      address = Address.find(params[:order][:address][:id]) 
      @order.address = address
    end

    if @order.update(order_params)
      render_success(:show, :ok, nil, @order)
    else
      render_validation_error(:show, validation_message_maker(@order), 8000)
    end
	end

	def create
	  @order = Order.create(order_params)

    if @order.valid? && @order.save
      render_success(:show, :created, nil, @order)
    else
      render_validation_error(:show, validation_message_maker(@order), 8000)
    end
	end

	def destroy
		@order.destroy
    if @order.destroy
      render_success(:show, :deleted)
    else
      render_validation_error(:show, validation_message_maker(@order), 8000)
    end
	end

	private 
	def set_order
		@order = Order.find(params[:id])
	end
end
