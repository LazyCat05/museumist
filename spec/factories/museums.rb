FactoryBot.define do
  factory :museum do
    sequence(:name) {|n| "Museum #{n}" }
    location  "Boston"
  end
end
