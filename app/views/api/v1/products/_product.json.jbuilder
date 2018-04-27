json.extract! product, :id, :name, :description, :price, :discount, :new_price, :created_at, :updated_at

json.images do
  json.array! product.product_images do |product_image|
    json.image_url_small (asset_url(product_image.image.url(:small)))
  end
end

json.sub_category product.sub_category.name if product.sub_category
json.category product.category.name if product.category