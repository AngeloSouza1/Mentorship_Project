class Book < ApplicationRecord
    belongs_to :author
    has_many :assemblies_parts
    validates :isbn, presence: true, length: { is: 13 }, format: { with: /\A\d+\z/, message: "deve conter apenas números" }
end
