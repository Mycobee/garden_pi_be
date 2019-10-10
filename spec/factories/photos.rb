FactoryBot.define do
  factory :photo do
    sequence(:url) { |n| "notreal#{n}.com"}
    garden
  end
end
