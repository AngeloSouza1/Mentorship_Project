# app/models/account.rb

class Account < ApplicationRecord
    belongs_to :supplier
    validates :digito_verificador, presence: true, length: { is: 1 }
    validates :account_number, presence: true, length: { is: 12 }
    
      def calcular_digito_verificador
        numero_conta = self.account_number
        pesos = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5]
        soma = 0
    
        numero_conta.to_s.reverse.chars.each_with_index do |digito, index|
          soma += digito.to_i * pesos[index % 12]
        end
    
        resto = soma % 11
        digito_verificador = (resto < 2) ? 0 : (11 - resto)
    
        self.digito_verificador = digito_verificador.to_s
        digito_verificador
      end
    end
    