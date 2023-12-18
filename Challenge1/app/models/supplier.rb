class Supplier < ApplicationRecord
  validates :name, presence: true  
  validates :cnpj, presence: true, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/, message: "deve estar no formato XX.XXX.XXX/YYYY-ZZ" }
  has_many :authors, foreign_key: :sup_id
  end  

 
