FactoryBot.define do
  factory :activity_log do
    baby
    assistant
    activity
    start_time { Faker::Time.between_dates(from: Date.today, to: Date.today, period: :morning) }
  end
end
