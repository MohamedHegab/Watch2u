class Api::V1::ProductsController < Api::BaseController
	respond_to :json
  before_action :authenticate_with_token!
	load_and_authorize_resource

  before_action :set_category
  before_action :set_product, only: [:update, :destroy]

	def index
		page_size = params[:page_size]
    @q = @sub_category.products.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.empty?

    @products = @q.result.page(page_size)
    # @products = @products.per(page_size)
    render_success(:index, :ok, nil, @products)
	end

	def show
    render_success(:show, :ok, nil, @product)
	end

	def update
		if @product.update(product_params)
      render_success(:show, :ok, nil, @product)
    else
      render_validation_error(:show, t('product.product_can_not_be_updated'), 8000)
    end
	end

	def create
	  @product = @sub_category.products.create(product_params)

    @product.save_attachments(product_params) if params[:product][:product_image_data]

    if @product.valid? && @product.save
      render_success(:show, :created, nil, @product)
    else
      render_validation_error(:show, t('product.product_can_not_be_created'), 8000)
    end
	end

	def destroy
		@product.destroy
    if @product.destroy
      render_success(:show, :deleted)
    else
      render_validation_error(:show, t('product.product_can_not_be_deleted'), 8000)
    end
	end

	private

  def set_category
    @category = Category.find(params[:category_id])
    @sub_category = @category.sub_categories.find(params[:sub_category_id])
  end

	def set_product
    @product = @sub_category.products.find(params[:id])
  end

	def product_params
	  params.require(:product).permit(:name, :description, :price, :discount, :sub_category_id, :category_id, product_image_data: [])
	end
end
