RSpec.describe Targetdata::Api::Pf do
  context "Success path" do
    let!(:cpf) { '35318965040' }
    let!(:api) { Targetdata::Api::Pf.new(cpf) }

    before do
      Targetdata.configure do |config|
        config.client_secret = ENV['TARGET_CLIENT_SECRET']
        config.username      = ENV['TARGET_USERNAME']
        config.password      = ENV['TARGET_PASSWORD']
        config.company_id    = ENV['TARGET_COMPANY_ID']
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
        expect(person.birth).to eq("1991-06-05")
        expect(person.cpf).to eq("35318965040")
        expect(person.email).to eq("joaosilvagarcia@gmail.com")
        expect(person.death).to eq("0")
        expect(person.first_name).to eq("JOAO SILVA")
        expect(person.gender).to eq("I")
        expect(person.last_name).to eq("GARCIA")
        expect(person.marital_status).to eq(nil)
        expect(person.middle_name).to eq("")
        expect(person.minor).to eq("0")
        expect(person.mother_first_name).to eq("CLAUDIA MARIA")
        expect(person.mother_last_name).to eq("GARCIA")
        expect(person.mother_middle_name).to eq("DA SILVA")
        expect(person.nationality).to eq("Brasileiro")
        expect(person.rg_number).to eq(nil)
        expect(person.rg_orgao_emissor).to eq(nil)
        expect(person.rg_uf).to eq(nil)
        expect(person.schooling).to eq("2º grau completo (ensino médio)")
        expect(person.status_receita_federal).to eq("Regular")
        expect(person.voter_registration).to eq("302050270645")
      end
    end

    it "raises Unauthorized" do
      VCR.use_cassette('api/unauthorized') do
        expect { api.person }.to raise_exception(Targetdata::Errors::Unauthorized)
      end
    end

    it "raises Person Not Found" do
      VCR.use_cassette('api/person_not_found') do
        expect { api.person }.to raise_exception(Targetdata::Errors::PersonNotFound)
      end
    end
  end
end