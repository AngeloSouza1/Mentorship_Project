class Author < ApplicationRecord
    has_many :books
    validates :cpf, presence: true, length: { is: 11 }, uniqueness: true
    belongs_to :supplier, foreign_key: :sup_id
end
