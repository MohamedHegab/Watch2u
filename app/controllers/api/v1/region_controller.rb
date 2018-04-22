class Api::V1::RegionController < ApplicationController
	respond_to :json

	def index
		@regions = Region.all
	end
end
