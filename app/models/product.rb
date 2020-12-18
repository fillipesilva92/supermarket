class Product < ApplicationRecord
  validates :barcode, :image, :name, :price, presence: true
  validates :barcode, length: { is: 13 }
  validates :barcode, uniqueness: true
  validates :name, length: { minimum: 3 }
  validates :price, numericality: { greater_than: 0 }
  belongs_to :category
end