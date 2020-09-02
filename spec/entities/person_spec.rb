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
      "email":"Faker::Internet.email"
    }
  }
  it "initialize by request hash" do
    person = described_class.new request_hash
    expect(person.class).to eq(described_class)

    expect(person).to respond_to('cpf')
    expect(person).to respond_to('email')
    expect(person).to respond_to('first_name')
    expect(person).to respond_to('middle_name')
    expect(person).to respond_to('last_name')
    expect(person).to respond_to('gender')
    expect(person).to respond_to('birth')
    expect(person).to respond_to('status_receita_federal')
    expect(person).to respond_to('rg_number')
    expect(person).to respond_to('rg_orgao_emissor')
    expect(person).to respond_to('rg_uf')
    expect(person).to respond_to('voter_registration')
    expect(person).to respond_to('death')
    expect(person).to respond_to('nationality')
    expect(person).to respond_to('minor')
    expect(person).to respond_to('marital_status')
    expect(person).to respond_to('mother_first_name')
    expect(person).to respond_to('mother_middle_name')
    expect(person).to respond_to('mother_last_name')
    expect(person).to respond_to('schooling')
  end
end