class Product < ApplicationRecord
  after_create_commit { broadcast_prepend_to :products }
  after_update_commit { broadcast_replace_to :products }
  after_destroy_commit { broadcast_remove_to :products }

  belongs_to :category, optional: true
  has_many :order_products

  validates :description, presence: true
  validates :price, presence: true

  enum status: { active: 1, inactive: 0 }
end
