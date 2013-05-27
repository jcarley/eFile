# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "person-#{n}@example.com"
  end

  factory :user do
    sequence(:email) { |n| "person-#{n}@example.com" }
    sequence(:name) { |n| "Person #{n}" }
    sequence(:nickname) { |n| "Nickname #{n}" }
    description "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget nulla libero, in porta ante."
    provider "google"
    sequence(:uid) { |n|  "55532854#{n}" }
    image "http://graph.facebook.com/555328545/picture?type=square"
    token "AAADbJFKxrMMBAPafZB6lNExZAAqqGPDjKLK4qh69cG6xCDF05HWlVt4MgzoDGGVO482C9oaziUNSCVPLYZAWtDrCZCNub2ZCLAHBZBMivabQZDZD"
    expires_at "1345850077"
  end
end


