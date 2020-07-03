FactoryBot.define do
  factory :assistant do
    name { Faker::Name.name }
    group { "Group" }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
