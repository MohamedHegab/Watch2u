json.validation_errors object.errors.messages do |field, msg|
  json.property_name field
  json.messages object.errors.full_messages_for(field)
end