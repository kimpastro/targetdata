module Targetdata
  module Api
    module Requester
      def get_person
        response = HTTP.headers(cpf_headers).post(Targetdata::BASE_URL + '/PF/CPF', body: [@cpf].to_json)
        raise Targetdata::Errors::Unauthorized if response.status.unauthorized?
        
        response
      end

      private
        def cpf_headers
          {
            'Content-Type':'application/json',
            'Accept':'application/json',
            'Authorization': "Bearer #{token}"
          }
        end
    end
  end
end