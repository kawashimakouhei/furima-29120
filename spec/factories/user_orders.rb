FactoryBot.define do
  factory :user_order do
    postal_code { '223-0061' }
    prefecture { 1 }
    city { '横浜' }
    house_number { '港北区９' }
    prefecture { 1 }
    city { '東京都' }
    building_name { '東京ハイツ' }
    phone_number { '08012689443' }
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
