class Api::V1::OrderProductsController < Api::BaseController
	respond_to :json
  before_action :authenticate_with_token!
	load_and_authorize_resource

	def create
		last_user_order = current_user.orders.find_by(status: :draft)
		if last_user_order
			@order = last_user_order
		else
			@order = Order.create(customer_id: current_user.id)
		end

		@order_product = OrderProduct.new(order_product_params)
		@order_product.order_id = @order.id

    if @order_product.valid? && @order_product.save
      render_success(:show, :created, nil, @order)
    else
      render_validation_error(:show, t('order.order_can_not_be_created'), 8000)
    end
	end

	private
	def order_product_params
    params.require(:order_product).permit(:quantity, :price)
	end
end
