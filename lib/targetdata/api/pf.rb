module Targetdata
  module Api
    class Pf
      include Auth
      include Requester

      def initialize cpf
        @cpf = cpf
      end
      
      def person
        response = get_person
        Person.new hash_person(response.body.to_s)
      end

      private
        def hash_person string_body
          parsed = JSON.parse(string_body)

          raise Targetdata::Errors::PersonNotFound unless person_found?(parsed)
          parsed["result"].first["pessoa"]["cadastral"]
        end
        
        def person_found? hash
          !hash["result"].empty?
        end
    end
  end
end