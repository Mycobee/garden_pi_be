FactoryBot.define do
  factory :job do
    sequence(:name) { |n| "Job #{n}" }
  end
end
