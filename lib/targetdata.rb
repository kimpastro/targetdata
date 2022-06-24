require "targetdata/version"
require "http"

require_relative "targetdata/configuration"
require_relative "targetdata/errors/unauthorized"
require_relative "targetdata/errors/person_not_found"
require_relative "targetdata/errors/not_found"
require_relative "targetdata/entities/person"
require_relative "targetdata/entities/company"
require_relative "targetdata/api/auth"
require_relative "targetdata/api/requester"
require_relative "targetdata/api/pf"
require_relative "targetdata/api/cnpj"

module Targetdata
  BASE_URL = 'https://api.targetdata-smart.com/api'
  
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.person_by_cpf cpf
    Targetdata::Api::Pf.new(cpf).person
  end
end
