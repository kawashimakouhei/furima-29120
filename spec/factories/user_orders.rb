FactoryBot.define do
  factory :user_order do
    postal_code { '223-0061' }
    prefecture { 5 }
    city { '横浜' }
    house_number { '港北区９' }
    building_name { '東京ハイツ' }
    phone_number { '08012689443' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end


