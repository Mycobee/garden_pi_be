FactoryBot.define do
  factory :env_measurement do
    association :garden, factory: :garden
    sequence(:temperature) { |n| 58 + (n / 2) }
    sequence(:humidity) { |n| 20 + (n / 2) }
    sequence(:soil_moisture) { |n| 89 - (n / 2) }
  end
end
