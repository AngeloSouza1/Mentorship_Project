class AddAuthorTempRefToSuppliers < ActiveRecord::Migration[6.0]
  def change
    add_reference :suppliers, :author_temp, foreign_key: true
  end
end