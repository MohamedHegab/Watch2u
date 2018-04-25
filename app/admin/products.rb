ActiveAdmin.register Product do
  permit_params :name, :description , :sub_category_id, :category_id, :price, :discount, :product_images_attributes => [:image, :id, :_destroy]

  form do |f|
    f.inputs "Details" do
      f.input :category_id, :as => :select, :collection => Category.all.collect {|category| [category.name, category.id] }
      f.input :sub_category_id, :as => :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/api/v1/categories/:product_category_id/sub_categories', 'data-option-observed' => 'product_category_id'}, :collection => (resource.category ? resource.category.sub_categories.collect {|sub_category| [sub_category.name, sub_category.id]} : []) 
      f.input :name
			f.input :price
			f.input :discount
      f.input :description
    end

    f.has_many :product_images do |product_image|
      product_image.inputs "Product Image" do
        product_image.input :image, as: :file
	      if product_image.object.image.present?
	        product_image.semantic_fields_for :image_attributes do |image_fields|
	          image_fields.input :_destroy, as: :boolean, label: 'Delete?'
	        end
	      end
	      # product_image.input :image, :as => :file, :hint => product_image.object.new_record? ? "" : f.template.image_tag(product_image.object.image.url(:thumb))
      end
    end
    f.actions
  end

  show do |product|
    attributes_table do
      row :category
      row :sub_category
      row :name
      row :price
      row :discount
      row :description
    end
    panel "Product Images"  , only: [:show, :edit]  do
      table_for product.product_images do
        column :image do  |p|
          image_tag(p.image.url(:medium))
        end
      end
    end
  end
end
