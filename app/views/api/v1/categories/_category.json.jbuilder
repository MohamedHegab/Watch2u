json.extract! category, :id, :name, :slug, :image, :created_at, :updated_at
json.sub_categories do
  json.array! category.sub_categories, partial: 'api/v1/sub_categories/sub_category', as: :sub_category
end