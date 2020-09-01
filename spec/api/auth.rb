RSpec.describe Targetdata::Api::Base do
  context "Success path" do
    let!(:auth) { Targetdata::Api::Base.new }

    before do
      Targetdata.configure do |config|
        config.client_secret = ENV['TARGET_CLIENT_SECRET']
        config.username      = ENV['TARGET_USERNAME']
        config.password      = ENV['TARGET_PASSWORD']
        config.company_id    = ENV['TARGET_COMPANY_ID']
      end
    end
    
    it "Generate TOKEN" do
      VCR.use_cassette('api/token') do
        expect(auth.token).to_not be_empty
      end
    end
  end
end