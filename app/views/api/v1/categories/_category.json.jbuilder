json.extract! category, :id, :name, :slug, :created_at, :updated_at
json.image_url_original (asset_url(category.image.url(:original)))
json.image_url_medium (asset_url(category.image.url(:medium)))
json.image_url_small (asset_url(category.image.url(:small)))
