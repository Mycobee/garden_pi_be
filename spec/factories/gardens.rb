FactoryBot.define do
  factory :garden do
    sequence(:name) { |n| "Garden #{n}" }
		sequence(:latitude) { |n| 40 - n}
		sequence(:longitude) { |n| 95 + n}
  end
end
