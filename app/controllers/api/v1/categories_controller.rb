class Api::V1::CategoriesController < Api::BaseController
	respond_to :json
  before_action :authenticate_with_token!, except: [:index]
	load_and_authorize_resource except: [:index]
	
  before_action :set_category, only: [:show, :update, :destroy]

	def index
		page_size = params[:page_size]
    @q = Category.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.empty?

    @categories = @q.result.page(page_size)
    render_success(:index, :ok, nil, @categories)
	end

	def show
    render_success(:show, :ok, nil, @category)
	end

	def update
		if @category.update(category_params)
      render_success(:show, :ok, nil, @category)
    else
      render_validation_error(:show, t('category.category_can_not_be_updated'), 8000)
    end
	end

	def create
	  @category = Category.create(category_params)
    if @category.valid? && @category.save
      render_success(:show, :created, nil, @category)
    else
      render_validation_error(:show, t('category.category_can_not_be_created'), 8000)
    end
	end

	def destroy
		@category.destroy
    if @category.destroy
      render_success(:show, :deleted)
    else
      render_validation_error(:show, t('category.category_can_not_be_deleted'), 8000)
    end
	end

	private

	def set_category
    @category = Category.find(params[:id])
  end

	def category_params
	  params.require(:category).permit(:name, :image_file_name, :image_content)
	end
end
