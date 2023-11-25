class AssembliesPart < ApplicationRecord
  belongs_to :assembly
  belongs_to :part
  belongs_to :book, class_name: 'Book', foreign_key: 'book_id'
end
