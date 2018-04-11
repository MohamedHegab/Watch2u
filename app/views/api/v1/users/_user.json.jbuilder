# User Model
json.id user.id
json.username user.username
json.email user.email
json.code user.code
json.mobile user.mobile
json.gender user.gender
json.region user.region
json.address user.address
json.partial! 'api/v1/validation_error', object: user

