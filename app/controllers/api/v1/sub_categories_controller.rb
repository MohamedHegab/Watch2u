class Api::V1::SubCategoriesController < Api::BaseController
	respond_to :json
  before_action :authenticate_with_token!, except: [:index]
	load_and_authorize_resource  except: [:index]
	
  before_action :set_category
  before_action :set_sub_category, only: [:update, :destroy]

	def index
		page_size = params[:page_size]
    @q = @category.sub_categories.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.empty?

    @sub_categories = @q.result.page(page_size)
    # @sub_categories = @sub_categories.per(page_size)
    render_success(:index, :ok, nil, @sub_categories)
	end

	def show
    render_success(:show, :ok, nil, @sub_category)
	end

	def update
		if @sub_category.update(sub_category_params)
      render_success(:show, :ok, nil, @sub_category)
    else
      render_validation_error(:show, t('sub_category.sub_category_can_not_be_updated'), 8000)
    end
	end

	def create
	  @sub_category = @category.sub_categories.create(sub_category_params)
    if @sub_category.valid? && @sub_category.save
      render_success(:show, :created, nil, @sub_category)
    else
      render_validation_error(:show, t('sub_category.sub_category_can_not_be_created'), 8000)
    end
	end

	def destroy
		@sub_category.destroy
    if @sub_category.destroy
      render_success(:show, :deleted)
    else
      render_validation_error(:show, t('sub_category.sub_category_can_not_be_deleted'), 8000)
    end
	end

	private

	def set_category
		@category = Category.find(params[:category_id])
	end

	def set_sub_category
    @sub_category = @category.sub_categories.find(params[:id])
  end

	def sub_category_params
	  params.require(:sub_category).permit(:name, :image, :category_id, :image_file_name, :image_content)
	end
end
