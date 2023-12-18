class AddValorToParts < ActiveRecord::Migration[7.1]
  def change
    add_column :parts, :valor, :decimal
  end
end
