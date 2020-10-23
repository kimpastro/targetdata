RSpec.describe Targetdata::Entities::Person do
  let!(:request_hash) {
    {
      "CPF": Faker::Number.number(11),
      "nomePrimeiro": Faker::Name.first_name,
      "nomeMeio": Faker::Name.middle_name,
      "nomeUltimo": Faker::Name.last_name,
      "sexo": ['M', 'F', 'I'].sample,
      "dataNascimento": Faker::Date.birthday.strftime('%Y-%m-%d'),
      "statusReceitaFederal": 'Regular',
      "rgNumero": Faker::Number.number,
      "rgOrgaoEmissor": 'SESP-PR',
      "rgUf": 'PR',
      "tituloEleitoral": Faker::Number.number,
      "obito": ["0", "1"].sample,
      "nacionalidade": 'Brasileiro',
      "menorDeIdade": "0",
      "estadoCivil": nil,
      "maeNomePrimeiro": Faker::Name.first_name,
      "maeNomeMeio": Faker::Name.middle_name,
      "maeNomeUltimo": Faker::Name.last_name,
      "escolaridade": "Ensino médio",
      "email": Faker::Internet.email
    }
  }

  before(:each) do
    @person = described_class.new request_hash
  end

  it "initialize by request hash" do
    expect(@person.class).to eq(described_class)

    expect(@person).to respond_to('cpf')
    expect(@person).to respond_to('email')
    expect(@person).to respond_to('first_name')
    expect(@person).to respond_to('middle_name')
    expect(@person).to respond_to('last_name')
    expect(@person).to respond_to('gender')
    expect(@person).to respond_to('birth')
    expect(@person).to respond_to('status_receita_federal')
    expect(@person).to respond_to('rg_number')
    expect(@person).to respond_to('rg_orgao_emissor')
    expect(@person).to respond_to('rg_uf')
    expect(@person).to respond_to('voter_registration')
    expect(@person).to respond_to('death')
    expect(@person).to respond_to('nationality')
    expect(@person).to respond_to('minor')
    expect(@person).to respond_to('marital_status')
    expect(@person).to respond_to('mother_first_name')
    expect(@person).to respond_to('mother_middle_name')
    expect(@person).to respond_to('mother_last_name')
    expect(@person).to respond_to('schooling')
  end

  it "person's attribute equal to the hash" do
    expect(@person.cpf).to                    eq(request_hash['CPF'])
    expect(@person.email).to                  eq(request_hash['email'])
    expect(@person.first_name).to             eq(request_hash['nomePrimeiro'])
    expect(@person.middle_name).to            eq(request_hash['nomeMeio'])
    expect(@person.last_name).to              eq(request_hash['nomeUltimo'])
    expect(@person.gender).to                 eq(request_hash['sexo'])
    expect(@person.birth).to                  eq(request_hash['dataNascimento'])
    expect(@person.status_receita_federal).to eq(request_hash['statusReceitaFederal'])
    expect(@person.rg_number).to              eq(request_hash['rgNumero'])
    expect(@person.rg_orgao_emissor).to       eq(request_hash['rgOrgaoEmissor'])
    expect(@person.rg_uf).to                  eq(request_hash['rgUf'])
    expect(@person.voter_registration).to     eq(request_hash['tituloEleitoral'])
    expect(@person.death).to                  eq(request_hash['obito'])
    expect(@person.nationality).to            eq(request_hash['nacionalidade'])
    expect(@person.minor).to                  eq(request_hash['menorDeIdade'])
    expect(@person.marital_status).to         eq(request_hash['maeNomePrimeiro'])
    expect(@person.mother_first_name).to      eq(request_hash['maeNomeMeio'])
    expect(@person.mother_middle_name).to     eq(request_hash['maeNomeUltimo'])
    expect(@person.mother_last_name).to       eq(request_hash['escolaridade'])
    expect(@person.schooling).to              eq(request_hash['escolaridade'])
  end

  it "full name method" do
    full_name = "#{request_hash['nomePrimeiro']} #{request_hash['nomeMeio']} #{request_hash['nomeUltimo']}".strip
    expect(@person.full_name).to eq(full_name)
  end
end