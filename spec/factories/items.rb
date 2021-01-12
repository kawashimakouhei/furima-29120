FactoryBot.define do
  factory :item do
    title              {Faker::Lorem.sentence}
    text               {Faker::Lorem.sentence}
    category_id        { 1 }
    condition_id       { 1 }
    shipping_id        { 1 }
    prefecture_id      { 1 }
    day_to_ship_id     { 1 }
    price              { 2000 }
    association :user 
  end
end

