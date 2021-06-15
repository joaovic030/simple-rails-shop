FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    brand
    category
    add_attribute(:for) { Faker::Lorem.sentence }
    image_url { Faker::Internet.url }
    price { Faker::Commerce.price }
    desc1 { Faker::Lorem.sentence }
    desc2 { Faker::Lorem.sentence(word_count: 10) }
  end
end
