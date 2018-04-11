#  Class to help generate Google DynamicLinks
module Google

  class DynamicLink

    def self.generate_link(link)
      dla = Settings.dynamic_link.app_code
      ibi = Settings.dynamic_link.ios_app_bundle_id
      isi = Settings.dynamic_link.ios_app_store_id
      iip = Settings.dynamic_link.ios_app_id_prefix
      apn = Settings.dynamic_link.android_app_package_name
      "https://#{dla}.app.goo.gl/?link=#{link}&apn=#{apn}&ibi=#{ibi}&isi=#{isi}"
    end

    def self.generate_short_link(link)
      long = self.generate_link(link)

      # call google REST api
      uri = URI.parse("https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=#{Settings.google_firebase_api_key}")

      header = {'Content-Type': 'text/json'}
      data = {longDynamicLink: long}


      # Create the HTTP objects
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = data.to_json
      http.use_ssl = true
      puts "I am here"
      # Send the request
      begin
        response = http.request(request)
        result = JSON.parse(response.body)
        return result["shortLink"]

      rescue
        return long
      end

    end
  end
end