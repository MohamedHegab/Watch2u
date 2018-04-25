json.extract! category, :id, :name, :slug, :created_at, :updated_at
json.image_url_medium (asset_url(category.image.url(:medium)))
json.sub_categories do
  json.array! category.sub_categories, partial: 'api/v1/sub_categories/sub_category', as: :sub_category
end