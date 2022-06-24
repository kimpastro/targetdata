require 'rubygems'
require 'bundler/setup'
Bundler.require(:test)

require 'targetdata'
require 'faker'
require 'webmock/rspec'
require_relative 'support/vcr'

require 'dotenv'

Dotenv.load('.env.local')
Dotenv.load('.env.test.local')

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

JSON_PRETTY_PRINT_ARGS = {
  indent: "\s\s",
  space: "\s",
  array_nl: "\n",
  object_nl: "\n",
}.freeze
