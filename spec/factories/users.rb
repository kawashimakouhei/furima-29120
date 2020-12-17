FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"kk1989"}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"田中"}
    first_name_reading    {"タロウ"}
    last_name_reading     {"タナカ"}
    birthdate             {"1989-07-22"}
  end
end



