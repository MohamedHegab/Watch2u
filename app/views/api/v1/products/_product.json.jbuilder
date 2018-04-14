json.extract! product, :id, :name, :slug, :description, :price, :discount, :created_at, :updated_at
json.sub_category product.sub_category.name
json.category product.category.name