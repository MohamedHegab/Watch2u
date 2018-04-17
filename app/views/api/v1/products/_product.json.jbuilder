json.extract! product, :id, :name, :slug, :description, :price, :discount, :created_at, :updated_at
json.sub_category product.sub_category.name if product.sub_category
json.category product.category.name if product.category