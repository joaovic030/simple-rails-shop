FactoryBot.define do
  factory :order do
    user
    total_price { Faker::Commerce.price(range: 100.00..2000.0) }
    discount { Faker::Number.number(digits: 2) }

    factory :order_with_products do
      after(:create) do |order, evaluator|
        create_list(:order_product, 2, order: order)
      end
    end

    factory :order_without_products do

    end
  end
end
