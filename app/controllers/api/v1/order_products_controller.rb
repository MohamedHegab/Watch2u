class Api::V1::OrderProductsController < Api::BaseController
	respond_to :json
  before_action :authenticate_with_token!
	load_and_authorize_resource

	before_action :set_order

	def create
		if @last_user_order
			@order = @last_user_order
		else
			@order = Order.create(customer_id: current_user.id)
		end

		##### to find if the product is added to cart before or not
		product = @order.order_products.find_by(product_id: order_product_params[:product_id])
		if product
			@order_product = product
			order_product_quantity = @order_product.quantity || 0
			@order_product.update(quantity: (order_product_params[:quantity].to_i + order_product_quantity))
		else
			@order_product = OrderProduct.new(order_product_params)
			@order.order_products << @order_product
		end
		##########################################################
		
    if @order_product.valid? && @order_product.save
    	@order.calculate_sub_total_and_total
      render_success(:show, :created, nil, @order)
    else
      render_validation_error(:show, validation_message_maker(@order_product), 8000)
    end
	end

	def update
		@order = @last_user_order
		product = @order.order_products.find_by(product_id: order_product_params[:product_id])
		if @order && product
			@order_product = product
			if @order_product.update(quantity: order_product_params[:quantity].to_i )
	    	@order.calculate_sub_total_and_total
	      render_success(:show, :updated, nil, @order)
			else
	      render_validation_error(:show, validation_message_maker(@order_product), 8000)
			end
		else
	    render_fail('This product is not in cart', nil, nil)
		end 
	end

	private
	def order_product_params
    params.require(:order_product).permit(:product_id, :quantity)
	end

	def set_order
		@last_user_order = current_user.orders.find_by(status: :draft)
	end
end
