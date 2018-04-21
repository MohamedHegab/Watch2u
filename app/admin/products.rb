ActiveAdmin.register Product do
  permit_params :name, :description , :sub_category_id, :price, :discount


end
