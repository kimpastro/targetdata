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
        Entities::Person.new hash_person(response.body.to_s)
      end

      private
        def hash_person string_body
          parsed = JSON.parse(string_body)

          raise Targetdata::Errors::PersonNotFound unless person_found?(parsed)
          
          parse_person_hash parsed["result"].first["pessoa"]
        end
        
        def person_found? hash
          !hash["result"].empty?
        end

        def parse_person_hash hash
          hash["cadastral"]["email"] = hash["contato"]["email"].first["email"]
          hash["cadastral"]
        end
    end
  end
end