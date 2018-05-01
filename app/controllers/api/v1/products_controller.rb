class Api::V1::ProductsController < Api::BaseController
	respond_to :json
  before_action :authenticate_with_token!, except: [:index, :show]
	load_and_authorize_resource except: [:index, :show]

  before_action :set_category, except: [:show, :destroy]
  before_action :set_product, only: [:update, :destroy, :show]

	def index
		page_size = params[:page_size]
    @q = @sub_category.products.ransack(params[:q])
    @q.sorts = 'created_at' if @q.sorts.empty?

    @products = @q.result.page(page_size)

    render_success(:index, :ok, nil, @products)
	end

	def show
    render_success(:show, :ok, nil, @product)
	end

	def update
		if @product.update(product_params)
      render_success(:show, :ok, nil, @product)
    else
      render_validation_error(:show, validation_message_maker(@product), 8000)
    end
	end

	def create
	  @product = @sub_category.products.create(product_params)
    
    @product.save_attachments(product_params) if params[:product][:product_image_data]
    @product.category_id = @sub_category.category_id

    if @product.valid? && @product.save
      render_success(:show, :created, nil, @product)
    else
      render_validation_error(:show, validation_message_maker(@product), 8000)
    end
	end

	def destroy
		@product.destroy
    if @product.destroy
      render_success(:show, :deleted)
    else
      render_validation_error(:show, validation_message_maker(@product), 8000)
    end
	end

	private

  def set_category
    # @category = Category.find(params[:category_id])
    @sub_category = SubCategory.find(params[:sub_category_id])
  end

	def set_product
    @product = Product.find(params[:id])
  end

	def product_params
	  params.require(:product).permit(:name, :description, :price, :discount, :sub_category_id, :category_id, product_image_data: [:image_file_name, :image_content])
	end
end
