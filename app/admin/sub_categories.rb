ActiveAdmin.register SubCategory do

  menu :parent => "Category"
  permit_params :name, :image , :category_id, products_attributes: [:name,:description, :price,:discount],sub_category_attributes: [:_destroy]
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :image, as: :file
      if f.object.image.present?
        f.semantic_fields_for :image_attributes do |image_fields|
          image_fields.input :_destroy, as: :boolean, label: 'Delete?'
        end
      end
      f.input :category, :as => :select, :collection => Category.all.map {|u| [u.name, u.id]}, :include_blank => false

    end
    # f.has_many :products do |product|
    #   product.inputs "Sub Categories" do
    #     if !product.object.nil?
    #       # show the destroy checkbox only if it is an existing appointment
    #       # else, there's already dynamic JS to add / remove new appointments
    #       product.input :_destroy, :as => :boolean, :label => "Destroy?"
    #     end

    #     product.input :name # it should automatically generate a drop-down select to choose from your existing patients
    #     product.input :description
    #     product.input :price
    #     product.input :discount
    #   end
    # end

    f.actions

  end

  show do |sub_category|
    attributes_table do
      row :name
      row :image do
        image_tag(sub_category.image.url(:medium))
      end
    end
    panel "Products"  , only: [:show, :edit]  do
      table_for sub_category.products do
        column :name do  |p|
          link_to p.name, admin_product_path(p)
        end
        column :description
        column :price
        column :discount
      end
    end
  end

  index do
    selectable_column

    column "Name" do |sc|
      link_to sc.name, admin_sub_category_path(sc.id)
    end

    column "Images" do |sc|
      image_tag(sc.image.url(:thumb))
    end

    actions
  end

end
