class Api::V1::RegionController < ApplicationController
	respond_to :json

	def index
		@regions = Region.all
    render_success(:index, :ok, nil, @regions)
	end
end
