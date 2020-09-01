module Targetdata
  module Api
    class Pf < Base
      def initialize cpf
        @cpf = cpf
      end
      
      def person
        response = HTTP.headers(cpf_headers).post(BASE_URL + '/PF/CPF', body: [@cpf].to_json)
        raise Targetdata::Errors::Unauthorized if response.status.unauthorized?
        payload = JSON.parse(response.body.to_s)
        
        raise Targetdata::Errors::PersonNotFound unless person_found?(payload)
        Person.new hash_person(payload)
      end

      private
        def cpf_headers
          {
            'Content-Type':'application/json',
            'Accept':'application/json',
            'Authorization': "Bearer #{token}"
          }
        end

        def hash_person parsed
          parsed["result"].first["pessoa"]["cadastral"]
        end

        def person_found? hash
          !hash["result"].empty?
        end
    end
  end
end