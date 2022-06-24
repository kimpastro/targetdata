RSpec.describe Targetdata::Api::CNPJ do
  let(:cnpj) { ENV.fetch('TEST_CNPJ') }

  before do
    Targetdata.configure do |config|
      config.username      = ENV.fetch('TARGET_USERNAME')
      config.password      = ENV.fetch('TARGET_PASSWORD')
      config.company_id    = ENV.fetch('TARGET_COMPANY_ID')
      config.client_secret = ENV.fetch('TARGET_CLIENT_SECRET')
    end
  end

  it 'returns company information' do
    company = VCR.use_cassette('api/company') do
      described_class.new(cnpj).company
    end

    expect(
      company.to_json(JSON_PRETTY_PRINT_ARGS)
    ).to match_snapshot('company')
  end

  it 'raises not found' do
    VCR.use_cassette('api/company_not_found') do
      expect {
        described_class.new('00000000000000').company
      }.to raise_exception(Targetdata::Errors::NotFound)
    end
  end

  it 'raises unauthorized' do
    Targetdata.configure do |config|
      config.username      = 'dummy'
      config.password      = 'dummy'
      config.company_id    = 'dummy'
      config.client_secret = 'dummy'
    end

    VCR.use_cassette('api/company_unauthorized') do
      expect {
        described_class.new(cnpj).company
      }.to raise_exception(Targetdata::Errors::Unauthorized)
    end
  end
end
