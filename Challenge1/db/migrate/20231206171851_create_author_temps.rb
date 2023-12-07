class CreateAuthorTemps < ActiveRecord::Migration[7.1]
  def change
    create_table :author_temps do |t|
      t.integer :sup_id
      t.string :name

      t.timestamps
    end
  end
end
