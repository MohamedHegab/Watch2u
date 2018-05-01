class Api::V1::CartsController < Api::BaseController
	include OrderUpdateWithParams

	respond_to :json
  before_action :authenticate_with_token!
  before_action :set_order

	private 
	def set_order
		@order = current_user.orders.draft.last
		unless @order
	    render_fail('there is no products in cart', nil, nil)
		end
	end

end
