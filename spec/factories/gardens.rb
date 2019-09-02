FactoryBot.define do
  factory :garden do
    sequence(:name) { |n| "Garden #{n}" }
		sequence(:latitude) { |n| (40.1234 - (n + 1))}
		sequence(:longitude) { |n| (95.4321 + (n - 1))}
  end
end
