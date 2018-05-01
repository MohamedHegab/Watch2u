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
  
	def create
	  @order = Order.create(order_params)

    if @order.valid? && @order.save
      render_success(:show, :created, nil, @order)
    else
      render_validation_error(:show, t('order.order_can_not_be_created'), 8000)
    end
	end

	def destroy
		@order.destroy
    if @order.destroy
      render_success(:show, :deleted)
    else
      render_validation_error(:show, t('order.order_can_not_be_deleted'), 8000)
    end
	end

	private 
	def set_order
		@order = Order.find(params[:id])
	end
end
