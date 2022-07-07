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
          parse_person_hash parsed
        end
        
        def person_found? hash
          !!hash["result"]
        end

        def parse_person_hash hash
          pessoa = hash["result"].first["pessoa"]
          pessoa["cadastral"]["email"] = nil
          
          if hash["report"]["email"] >= 1
            pessoa["cadastral"]["email"] = pessoa["contato"]["email"].first["email"]
          end
          
          pessoa["cadastral"]
        end
    end
  end
end
