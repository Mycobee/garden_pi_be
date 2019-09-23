FactoryBot.define do
  factory :garden do
    association :user, factory: :user, password: "password"
    sequence(:name) { |n| "Garden #{n}" }
		sequence(:latitude) { |n| (40.1234 - (n))}
		sequence(:longitude) { |n| (95.4321 + (n))}
    max_moisture { 40 }
    min_moisture { 20 }
    auto_water { true }
  end
end
