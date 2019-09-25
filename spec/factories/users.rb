FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name) { |n| "Last #{n}" }
    sequence(:email) { |n| "#{n}user@email.com" }
    sequence(:password) { |n| "#{n}password" }
    sequence(:api_key) { |n| "#{n}api_key" }
    api_key_active { true }
  end
end
