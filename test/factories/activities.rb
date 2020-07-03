FactoryBot.define do
  factory :activity do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
