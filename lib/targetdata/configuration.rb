module Targetdata
  class Configuration
    attr_accessor :username, :password, :company_id, :client_secret, :grant_type, :client_id

    def initialize
      @grant_type = 'password'
      @client_id = 2
    end
  end
end