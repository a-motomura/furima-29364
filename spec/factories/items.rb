FactoryBot.define do
  factory :item do
    name               { Faker::Lorem.characters(number: 8) }
    introduction       { Faker::Lorem.characters(number: 10) }
    category_id { 1 }
    status_id         { 1 }
    postage_id        { 1 }
    prefecture_id      { 1 }
    preparation_day_id { 1 }
    price              { 3000 }
    association :user
  end
end
