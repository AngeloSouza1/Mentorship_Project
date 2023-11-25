class CreateAssembliesParts < ActiveRecord::Migration[7.1]
  def change
    create_table :assemblies_parts do |t|
      t.integer :livraria_book_id
      t.references :assembly, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.timestamps
    end
  end
end


