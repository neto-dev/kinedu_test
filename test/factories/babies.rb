FactoryBot.define do
  factory :baby do
    name { Faker::Name.name }
    birthday { Faker::Date.in_date_period }
    mother_name { Faker::Name.female_first_name }
    father_name { Faker::Name.male_first_name }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
