class Stock < ApplicationRecord
  validates :quantity, presence: true
  validates :product_id, uniqueness: true
  belongs_to :product
end