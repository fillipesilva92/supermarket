class Stock < ApplicationRecord
  validates :quantity, presence: true
end