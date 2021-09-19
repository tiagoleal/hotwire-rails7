FactoryBot.define do
  factory :product do
    sequence(:description) { |n| "Product #{n}" }
    price { Faker::Commerce.price(range: 100.0..400.0) }
    status { :active }
    category
  end
end