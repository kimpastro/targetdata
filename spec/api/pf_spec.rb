RSpec.describe Targetdata::Api::Pf do
  context "Success path" do
    let(:cpf) { ENV.fetch('TEST_CPF') }
    let(:api) { Targetdata::Api::Pf.new(cpf) }

    before do
      Targetdata.configure do |config|
        config.username      = ENV.fetch('TARGET_USERNAME')
        config.password      = ENV.fetch('TARGET_PASSWORD')
        config.company_id    = ENV.fetch('TARGET_COMPANY_ID')
        config.client_secret = ENV.fetch('TARGET_CLIENT_SECRET')
      end
    end
    
    it "Has token" do
      VCR.use_cassette('api/person') do
        expect(api.token).to_not be_empty
      end
    end

    it "Find Person with CPF" do
      VCR.use_cassette('api/person') do
        person = api.person
        
        expect(person.class).to eq(Targetdata::Entities::Person)
        expect(person.cpf).to eq(cpf)

        expect(
          person.to_json(JSON_PRETTY_PRINT_ARGS)
        ).to match_snapshot('person')
      end
    end

    context :unauthorized do
      let(:api) { Targetdata::Api::Pf.new(cpf) }

      before do
        Targetdata.configure do |config|
          config.username      = 'dummy'
          config.password      = 'dummy'
          config.company_id    = 'dummy'
          config.client_secret = 'dummy'
        end
      end

      it "raises Unauthorized" do
        VCR.use_cassette('api/unauthorized') do
          expect {
            api.person
          }.to raise_exception(Targetdata::Errors::Unauthorized)
        end
      end
    end

    context :not_found do
      let(:cpf) { '00000000000' }
      let(:api) { Targetdata::Api::Pf.new(cpf) }

      it "raises Person Not Found" do
        VCR.use_cassette('api/person_not_found') do
          expect {
            api.person
          }.to raise_exception(Targetdata::Errors::PersonNotFound)
        end
      end
    end
  end
end
