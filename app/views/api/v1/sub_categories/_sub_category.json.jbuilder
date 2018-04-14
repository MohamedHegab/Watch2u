json.extract! sub_category, :id, :name, :slug, :image, :created_at, :updated_at
json.category sub_category.category.name
json.products do
  json.array! sub_category.products, partial: 'api/v1/products/product', as: :product
end