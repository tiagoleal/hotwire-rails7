FactoryBot.define do
  factory :order_product do
    quantity { Faker::Commerce.unique.promotion_code(digits: 1) }
    product
    order
  end
end