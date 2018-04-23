# User Model
json.id user.id
json.username user.username
json.email user.email
json.code user.code
json.mobile user.mobile
json.gender user.gender.value if user.gender
json.auth_token user.auth_token
json.addresses do
  json.array! user.addresses, partial: 'api/v1/address/address', as: :address
end
json.region user.region if user.region
json.partial! 'api/v1/validation_error', object: user

