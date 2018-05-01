class Api::V1::PaymentsController < Api::BaseController
	respond_to :json

	def index
		page_size = params[:page_size]
    @q = Payment.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.empty?

    @payments = @q.result.page(page_size)
    render_success(:index, :ok, nil, @payments)
	end
end
