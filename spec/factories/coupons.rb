FactoryBot.define do
  factory :coupon do
    description { Faker::Lorem.sentence }
    expired_date { Date.today+10 }
    percentage { Faker::Number.number(digits: 2) }
    token { Faker::Crypto.md5 }

    trait :deactivated do
      activated { false }
    end
    trait :activated do
      activated { true }
    end
  end
end