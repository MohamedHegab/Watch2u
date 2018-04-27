json.extract! sub_category, :id, :name, :slug, :created_at, :updated_at

json.image_url_medium (asset_url(sub_category.image.url(:medium)))

json.category sub_category.category.name