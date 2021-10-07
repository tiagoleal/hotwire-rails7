class Order < ApplicationRecord
  after_create_commit { broadcast_prepend_to :shoppingCartList }
  after_update_commit { broadcast_replace_to :shoppingCartList }
  after_destroy_commit { broadcast_remove_to :shoppingCartList }


  belongs_to :user

  has_many :order_products
  accepts_nested_attributes_for :order_products, allow_destroy: true, reject_if: :all_blank

  validates :user_id, uniqueness: { scope: :user, messages: "order has active"}
  validates :status, presence: true
  before_save :set_total
  before_update :set_total

  enum status: {'waiting': 1, 'confirm': 2}

  private 

  def subtotal
    order_products.collect { |order_prod| order_prod.valid? ? order_prod.unit_price * order_prod.quantity : 0}.sum
  end

  def set_subtotal
    self[:subtotal] = subtotal
  end

  def set_total
    self[:total] = subtotal
  end

  scope :waiting, ->{ where(status: 1)}
  scope :confirm, ->{ where(status: 2)}

end