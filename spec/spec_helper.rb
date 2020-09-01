require 'rubygems'
require 'bundler/setup'
Bundler.require(:test)

require 'targetdata'
require 'faker'
require 'webmock/rspec'
require_relative 'support/vcr'

require 'dotenv'
Dotenv.load('.env.test')

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
