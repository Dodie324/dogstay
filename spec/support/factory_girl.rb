require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    first_name "John"
    last_name "Doe"
    sequence(:phone_number) { |n| "555-827-43#{n}#{n}" }
    zipcode "02111"
    sitter false
    have_dogs "No"
    have_children "No"
    property_type ""
    yard_type ""
    availability ""

    factory :sitter do
      sequence(:email) { |n| "user#{n}@example#{n}.com" }
      password 'password'
      password_confirmation 'password'
      first_name "Terry"
      last_name "Moore"
      sequence(:phone_number) { |n| "55#{n}-#{n}#{n}#{n}-#{n}#{n}22" }
      address1 "33 Harrison Ave"
      city "Boston"
      state "MA"
      zipcode "02111"
      headline "I love dogs!"
      description "I have been a dog owner for many years, and would love to house a dog for you!"
      sitter true
      have_dogs "Yes"
      have_children "No"
      property_type "House"
      yard_type "Fenced"
      price "40"
      availability "Weekends"
    end
  end

  factory :review do
    rating 5
    body "John was wonderful to our dog, Fritz! He sent us updates daily and\
          even shared photos of Fritz playing with his dog. We definitely felt\
          at ease knowing Fritz was in good hands."
    user
    sitter
  end
end
