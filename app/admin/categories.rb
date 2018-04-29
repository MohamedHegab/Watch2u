ActiveAdmin.register Category do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  menu :parent => "Category"
  # has_many :sub_categories, dependent: :destroy
  permit_params :name, :image ,sub_categories_attributes:[:id, :name ,:image, :_destroy]

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
    end

    f.has_many :sub_categories do |sub_category|
      sub_category.inputs "Sub Categories" do
        # if !sub_category.object.nil?
        #   # show the destroy checkbox only if it is an existing appointment
        #   # else, there's already dynamic JS to add / remove new appointments
        #   sub_category.input :_destroy, :as => :boolean, :label => "Destroy?"
        # end

        sub_category.input :name # it should automatically generate a drop-down select to choose from your existing patients
        sub_category.input :image, as: :file
      end
    end

    f.actions
  end

  show do |category|

    attributes_table do
      row :name
      row :image do
        image_tag(category.image.url(:medium))
      end
    end

    panel "Sub Categries"  , only: [:show, :edit]  do
      table_for category.sub_categories do
        column :name do  |sc|
            link_to sc.name, admin_sub_category_path(sc)
        end
        column :image do |sc|
          image_tag(sc.image.url(:medium))
        end
      end
    end

  end


  index do
    selectable_column

    column "Name" do |category|
      link_to category.name, admin_category_path(category)
    end

    column "Images" do |category|
      image_tag(category.image.url(:thumb))
    end

    actions
  end

end
