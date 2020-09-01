require "targetdata/version"
require "http"

require_relative "targetdata/configuration"
require_relative "targetdata/errors/unauthorized"
require_relative "targetdata/errors/person_not_found"
require_relative "targetdata/api/base"
require_relative "targetdata/api/pf"
require_relative "targetdata/person"

module Targetdata
  BASE_URL = 'https://targetdatasmart.com/api'
  
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
