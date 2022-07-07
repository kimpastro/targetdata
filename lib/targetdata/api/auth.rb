module Targetdata
  module Api
    module Auth
      def token
        ENV.fetch('TARGET_DATA_ACCESS_TOKEN') || generate_access_token
      end

      private
        def auth_body
          {
            grant_type: Targetdata.configuration.grant_type,
            client_id: Targetdata.configuration.client_id,
            client_secret: Targetdata.configuration.client_secret,
            username: Targetdata.configuration.username,
            password: Targetdata.configuration.password,
            empresa: Targetdata.configuration.company_id
          }
        end
    
        def auth_headers
          {
            'Content-Type':'application/x-www-form-urlencoded',
            'Accept': 'application/json'
          }
        end

        def generate_access_token
          response = HTTP.headers(auth_headers).post(Targetdata::BASE_URL + '/token', form: auth_body)
          parsed = JSON.parse(response.body.to_s)
          parsed["access_token"]
        end
    end
  end
end
