module Targetdata
  module Entities
    class Person
      attr_accessor :cpf, 
                    :email,
                    :first_name, 
                    :middle_name, 
                    :last_name, 
                    :gender,
                    :birth,
                    :status_receita_federal,
                    :rg_number,
                    :rg_orgao_emissor,
                    :rg_uf,
                    :voter_registration,
                    :death,
                    :nationality,
                    :minor,
                    :marital_status,
                    :mother_first_name,
                    :mother_middle_name,
                    :mother_last_name,
                    :schooling
      
      def initialize params = {}
        @cpf                    = params['CPF']
        @email                  = params['email']
        @first_name             = params['nomePrimeiro']
        @middle_name            = params['nomeMeio']
        @last_name              = params['nomeUltimo']
        @gender                 = params['sexo']
        @birth                  = params['dataNascimento']
        @status_receita_federal = params['statusReceitaFederal']
        @rg_number              = params['rgNumero']
        @rg_orgao_emissor       = params['rgOrgaoEmissor']
        @rg_uf                  = params['rgUf']
        @voter_registration     = params['tituloEleitoral']
        @death                  = params['obito']
        @nationality            = params['nacionalidade']
        @minor                  = params['menorDeIdade']
        @marital_status         = params['estadoCivil']
        @mother_first_name      = params['maeNomePrimeiro']
        @mother_middle_name     = params['maeNomeMeio']
        @mother_last_name       = params['maeNomeUltimo']
        @schooling              = params['escolaridade']
      end

      def full_name
        "#{@first_name} #{@middle_name} #{@last_name}".strip
      end

      def to_json
        {
          cpf: @cpf,
          first_name: @first_name,
          middle_name: @middle_name,
          last_name: @last_name,
          gender: @gender,
          birth: @birth,
          status_receita_federal: @status_receita_federal,
          rg_number: @rg_number,
          rg_orgao_emissor: @rg_orgao_emissor,
          rg_uf: @rg_uf,
          voter_registration: @voter_registration,
          death: @death,
          nationality: @nationality,
          minor: @minor,
          marital_status: @marital_status,
          mother_first_name: @mother_first_name,
          mother_middle_name: @mother_middle_name,
          mother_last_name: @mother_last_name,
          schooling: @schooling
        }.to_json
      end
    end
  end
end