require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end

# FactoryBot.define do 
#   factory :museum do
#     sequence(:name) {|n| "Museum #{n}" }
#   end
# end
