class AddNomeToParts < ActiveRecord::Migration[7.1]
  def change
    add_column :parts, :nome, :string
  end
end
