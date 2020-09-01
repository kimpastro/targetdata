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
    let!(:cpf) { '35318965040' }

    before do
      Targetdata.configure do |config|
        config.username      = ENV['TARGET_USERNAME']
        config.password      = ENV['TARGET_PASSWORD']
        config.company_id    = ENV['TARGET_COMPANY_ID']
        config.client_secret = ENV['TARGET_CLIENT_SECRET']
      end
    end

    it "person_by_cpf" do
      VCR.use_cassette('api/person') do
        @person = Targetdata.person_by_cpf cpf
      end

      expect(@person.cpf).to eq('35318965040')
      expect(@person.first_name).to eq('JOAO SILVA')
      expect(@person.middle_name).to eq('')
      expect(@person.last_name).to eq('GARCIA')
      expect(@person.gender).to eq('I')
      expect(@person.birth).to eq('1991-06-05')
      expect(@person.status_receita_federal).to eq('Regular')
      expect(@person.rg_number).to be_nil
      expect(@person.rg_orgao_emissor).to be_nil
      expect(@person.rg_uf).to be_nil
      expect(@person.voter_registration).to eq('302050270645')
      expect(@person.death).to eq('0')
      expect(@person.nationality).to eq('Brasileiro')
      expect(@person.minor).to eq('0')
      expect(@person.marital_status).to be_nil
      expect(@person.mother_first_name).to eq('CLAUDIA MARIA')
      expect(@person.mother_middle_name).to eq('DA SILVA')
      expect(@person.mother_last_name).to eq('GARCIA')
      expect(@person.schooling).to eq('2º grau completo (ensino médio)')
    end
  end
end