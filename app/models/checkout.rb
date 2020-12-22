class Checkout < ApplicationRecord
  validates :total, :payment_method, presence: true
  validates :total, :change, numericality: { greater_than: 0 }
end