class Api::V1::RegionsController < Api::BaseController
	respond_to :json

	def index
		@regions = Region.all
    render_success(:index, :ok, nil, @regions)

	end
end
