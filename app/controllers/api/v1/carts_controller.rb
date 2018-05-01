class Api::V1::CartsController < Api::BaseController
	respond_to :json
  before_action :authenticate_with_token!
  before_action :set_order

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
      render_validation_error(:show, t('order.order_can_not_be_updated'), 8000)
    end
	end

	private 
	def set_order
		@order = current_user.orders.draft.last
	end

  def order_params
    params.require(:order).permit(:customer_id, :status, :address_id)
  end
end
