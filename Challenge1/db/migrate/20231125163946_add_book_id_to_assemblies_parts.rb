class AddBookIdToAssembliesParts < ActiveRecord::Migration[7.1]
  def change
    add_column :assemblies_parts, :book_id, :integer
  end
end
