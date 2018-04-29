# requires @response
if @response.is_a?(Hash)
  if @response.include?(:error)
    json.status :fail
    json.message @response[:message]
    json.code @response[:code] if @response.include?(:code)
    # json.data  @response[:data] if @response[:data]
  elsif @response.include?(:fail)
    json.status :fail
    # json.data @response[:data] if @response[:data]
    if @response[:message] && @response[:message].kind_of?(Array)
      json.messages @response[:message]
    elsif @response[:message]
      json.message @response[:message]
    end
  elsif @response.include?(:success)
    json.status :success
    json.data @response.include?(:data) ? @response[:data] : JSON.parse(yield)
  end
  json.code @response[:code] if @response.include?(:code)
end