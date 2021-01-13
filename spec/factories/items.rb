FactoryBot.define do
  factory :item do
    title              {Faker::Lorem.sentence}
    text               {Faker::Lorem.sentence}
    category_id        { 2 }
    condition_id       { 2 }
    shipping_id        { 2 }
    prefecture_id      { 2 }
    day_to_ship_id     { 2 }
    price              { 2000 }
    association :user 
  end
end



