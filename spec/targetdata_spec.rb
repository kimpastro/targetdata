RSpec.describe Targetdata do
  context "Gem it self" do
    it "has a version number" do
      expect(Targetdata::VERSION).not_to be nil
    end
  end

  context "Configuration" do
    let(:username) { Faker::Internet.username }
    let(:password) { Faker::Internet.password }
    let(:company_id) { Faker::Number.number }
    let(:client_secret) { Faker::Internet.password }

    it "can be configured" do
      Targetdata.configure do |config|
        config.username      = username
        config.password      = password
        config.company_id    = company_id
        config.client_secret = client_secret
      end
      
      expect(Targetdata.configuration.username).to eq(username)
      expect(Targetdata.configuration.password).to eq(password)
      expect(Targetdata.configuration.company_id).to eq(company_id)
      expect(Targetdata.configuration.client_secret).to eq(client_secret)
    end
  end

  context "Class Methods" do
    let(:cpf) { ENV.fetch('TEST_CPF') }

    before do
      Targetdata.configure do |config|
        config.username      = ENV.fetch('TARGET_USERNAME')
        config.password      = ENV.fetch('TARGET_PASSWORD')
        config.company_id    = ENV.fetch('TARGET_COMPANY_ID')
        config.client_secret = ENV.fetch('TARGET_CLIENT_SECRET')
      end
    end

    it "person_by_cpf" do
      person = VCR.use_cassette('api/person') do
        Targetdata.person_by_cpf cpf
      end

      expect(
        person.to_json(JSON_PRETTY_PRINT_ARGS)
      ).to match_snapshot('person')
    end
  end
end
