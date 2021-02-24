FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"aaa111"}
    password_confirmation {password}
    last_name_full        {"佐藤"}
    first_name_full       {"太郎"}
    last_name_kana        {"サトウ"}
    first_name_kana       {"タロウ"}
    birthday              {"2000-01-01"}
  end
end