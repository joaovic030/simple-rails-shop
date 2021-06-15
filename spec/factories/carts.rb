FactoryBot.define do
  factory :cart do
    product
    quantity { 1 }

    trait :admin do
      user  { create(:usuario, :admin) }
    end

    trait :ordinary do
      user  { create(:usuario, :admin) }
    end
  end
end
