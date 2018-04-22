json.extract! category, :id, :name, :slug, :created_at, :updated_at
json.image_url_small (asset_url(category.image.url(:small)))
json.sub_categories do
  json.array! category.sub_categories, partial: 'api/v1/sub_categories/sub_category', as: :sub_category
end