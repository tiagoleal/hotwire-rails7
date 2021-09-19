class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
end
