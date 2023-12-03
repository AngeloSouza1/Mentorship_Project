class AddDigitoVerificadorToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :digito_verificador, :string
  end
end
