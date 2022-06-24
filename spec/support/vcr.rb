VCR.configure do |config|
  config.cassette_library_dir = "spec/support/vcr_cassettes"
  config.hook_into :webmock
  config.default_cassette_options = { record: :all } if ENV.key?('VCR_RERECORD')
end
