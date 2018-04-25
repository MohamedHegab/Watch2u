ActiveAdmin.register Product do
  permit_params :name, :description , :sub_category_id, :category_id, :price, :discount

  form do |f|
    f.inputs "Details" do
      f.input :category, :as => :select, :collection => Category.all.collect {|category| [category.name, category.id] }
      f.input :sub_category, :as => :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/categories/:product_category_id/sub_categories', 'data-option-observed' => 'product_category_input'}, :collection => (resource.category ? resource.category.sub_categories.collect {|sub_category| [sub_category.name, sub_category.id]} : []) 
    end
    f.actions
  end
end
