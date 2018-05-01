class Api::V1::RegionsController < Api::BaseController
	respond_to :json

	def index
		page_size = params[:page_size]
    @q = Region.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.empty?

    @regions = @q.result.page(page_size)
    render_success(:index, :ok, nil, @regions)
	end
end
