FactoryBot.define do
  factory :order_product do
    product
    order
    quantity { [1,2,3,4,5].sample }
  end
end
