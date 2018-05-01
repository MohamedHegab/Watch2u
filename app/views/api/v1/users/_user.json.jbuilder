# User Model
json.id user.id
json.first_name user.first_name
json.last_name user.last_name
json.username user.username
json.email user.email
json.code user.code
json.mobile user.mobile
json.gender user.gender.value if user.gender
json.auth_token user.auth_token
json.addresses_attributes do
  json.array! user.addresses, partial: 'api/v1/addresses/address', as: :address
end
json.region user.region if user.region
json.image_url_original (asset_url(user.image.url(:original)))
json.image_url_medium (asset_url(user.image.url(:medium)))
json.image_url_small (asset_url(user.image.url(:small)))
json.partial! 'api/v1/validation_error', object: user
