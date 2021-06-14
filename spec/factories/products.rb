FactoryBot.define do
  factory :product do
    name { "MyText" }
    brand { nil }
    category { nil }
    image_url { "MyText" }
    # for { "MyText" }
    desc1 { "MyText" }
    desc2 { "MyText" }
  end
end
