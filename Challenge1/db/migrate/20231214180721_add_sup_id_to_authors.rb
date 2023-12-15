class AddSupIdToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :sup_id, :integer
  end
end
