module Targetdata
  module Api
    class CNPJ
      include Auth

      def initialize(cnpj)
        @cnpj = cnpj
      end

      def company
        json = get_company

        raise Targetdata::Errors::NotFound if json.fetch(:result).empty?

        company = json.fetch(:result)
                      .first
                      .fetch(:empresa)
                      .fetch(:cadastral)

        Entities::Company.new(company)
      end

      private
        # https://documenter.getpostman.com/view/5411685/SVfGyBgC#12206883-8e60-4f35-a686-215a9d894ab4
        # http://docs.targetsmart.com/
        # https://targetsmart.com/
        def get_company
          response = HTTP.headers(
                            {
                              'Content-Type' => 'application/json',
                              'Accept' => 'application/json',
                              'Authorization' => "Bearer #{token}"
                            }
                         )
                         .post(
                            Targetdata::BASE_URL + '/PJ/CNPJ',
                            body: [@cnpj].to_json
                         )

          raise Targetdata::Errors::Unauthorized if response.status.unauthorized?

          JSON.parse(response.body, symbolize_names: true)
        end
    end
  end
end
