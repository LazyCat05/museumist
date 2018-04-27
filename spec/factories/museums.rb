FactoryBot.define do
  factory :museum do
    # name  { Faker::Name.name }
    sequence(:name) {|n| "Museum #{n}" }
    location  "Boston"
  end
end
