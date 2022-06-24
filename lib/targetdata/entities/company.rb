module Targetdata
  module Entities
    class Company
      attr_reader :cnpj,
                  :social_reason,
                  :name,
                  :opening_date,
                  :parent_company,
                  :cadastral_status,
                  :cadastral_status_date,
                  :cadastral_status_reason,
                  :special_status,
                  :state_registration

      def initialize(hash)
        @cnpj                    = hash.fetch(:CNPJ)
        @name                    = hash.fetch(:razaoSocial)
        @fantasy_name            = hash.fetch(:nomeFantasia)
        @opening_date            = hash.fetch(:dataAbertura)
        @parent_company          = hash.fetch(:matriz)
        @cadastral_status        = hash.fetch(:situacaoCadastral)
        @cadastral_status_date   = hash.fetch(:dataSituacaoCadastral)
        @cadastral_status_reason = hash.fetch(:motivoSituacaoCadastral)
        @special_status          = hash.fetch(:situacaoEspecial)
        @state_registration      = hash.fetch(:inscricaoEstadual)
      end

      def to_json(*args)
        {
          cnpj: @cnpj,
          social_reason: @social_reason,
          name: @name,
          opening_date: @opening_date,
          parent_company: @parent_company,
          cadastral_status: @cadastral_status,
          cadastral_status_date: @cadastral_status_date,
          cadastral_status_reason: @cadastral_status_reason,
          special_status: @special_status,
          state_registration: @state_registration,
        }.to_json(*args)
      end
    end
  end
end
