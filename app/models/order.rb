class Order < ApplicationRecord
  belongs_to :user
  before_save :set_subtotal

  has_many :order_products
  accepts_nested_attributes_for :order_products, allow_destroy: true, reject_if: :all_blank
  
  before_save :set_total
 
  enum status: {'waiting': 1, 'confirm': 2}


  def subtotal
    order_products.collect { |order_prod| order_prod.valid? ? order_prod.unit_price * order_prod.quantity : 0}.sum
  end

  private 

  def set_subtotal
    self[:subtotal] = subtotal
  end

  def set_total
    self[:total] = subtotal
  end

  scope :waiting, ->{ where(status: 1)}
  scope :confirm, ->{ where(status: 2)}

end