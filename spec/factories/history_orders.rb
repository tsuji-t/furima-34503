FactoryBot.define do
  factory :history_order do

    postal    {"222-1111"}
    state_id  {2}
    city      {Faker::Team.state}
    address   {Faker::Lorem.sentence}
    building  {Faker::Team.state}
    phone     {"11122223333"}
    token     {"tok_abcdefghijk00000000000000000"}

  end
end

