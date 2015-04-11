require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    first_name "John"
    last_name "Doe"
    sequence(:phone_number) {|n| "555#{n}#{n}#{n}#{n}222"}
    address1 "33 Harrison Ave"
    city "Boston"
    state "MA"
    zipcode "02111"
    headline "I love dogs!"
    description "I have been a dog owner for many years, and would love to house a dog for you!"
    sitter "Yes"
    have_dogs "Yes"
    have_children "No"
    property_type "House"
    yard_type "Fenced"
  end
end
