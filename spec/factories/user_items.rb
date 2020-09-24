FactoryBot.define do
  factory :user_item do
    token              { 'token' }
    postal_code        { '123-4567' }
    prefecture_id      { 1 }
    city               { '横浜市緑区' }
    house_number       { '青山1-1-1' }
    building_name      { '柳ビル103' }
    phone_number       { '12345678901' }
  end
end
