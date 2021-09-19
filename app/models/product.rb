class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :order_products

  validates :description, presence: true
  validates :price, presence: true

  enum status: { active: 1, inactive: 0 }
end
