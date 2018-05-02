json.extract! address, :id, :name, :street_address, :country, :floor_no,
:building_no, :created_at, :updated_at

json.lat address.lat.to_f
json.lng address.lng.to_f
