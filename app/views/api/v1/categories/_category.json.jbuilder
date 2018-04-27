json.extract! category, :id, :name, :slug, :created_at, :updated_at
json.image_url_medium (asset_url(category.image.url(:medium)))
