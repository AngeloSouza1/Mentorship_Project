class Author < ApplicationRecord
    has_many :books
    validates :cpf, presence: true, length: { is: 11 }, uniqueness: true

end
