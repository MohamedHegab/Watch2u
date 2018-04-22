json.extract! sub_category, :id, :name, :slug, :created_at, :updated_at

json.image_url_small (asset_url(sub_category.image.url(:small)))

json.category sub_category.category.name

json.products do
  json.array! sub_category.products, partial: 'api/v1/products/product', as: :product
end