if @response.is_a?(Hash)
  if @response.include?(:error)
    json.status :error
    json.message @response[:message]
    json.code @response[:code] if @response.include?(:code)
    # json.data  @response[:data] if @response[:data]
  elsif @response.include?(:fail)
    json.status :fail
    json.data @response.include?(:data) ? @response[:data] : JSON.parse(yield)
    # json.data @response[:data] if @response.include?(:data)
    json.message @response[:message] if @response[:message]
  elsif @response.include?(:success)
    json.status :success
    json.message  @response[:message] if  @response[:message]
    json.data @response.include?(:data) ? @response[:data] : JSON.parse(yield)
    if @response.include?(:resource)
      if !@response[:no_meta]
        json.meta do
          if not @response[:resource].nil?
            json.pagination do
              json.current_page @response[:resource].try(:current_page)
              json.total_pages @response[:resource].try(:total_pages)

              json.size @response[:resource].try(:size)
              json.total_count @response[:resource].try(:total_count)
            end
          end
        end
      end
    end
  end
  json.code @response[:code] if @response.include?(:code)
end