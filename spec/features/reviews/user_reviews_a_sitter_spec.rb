require "rails_helper"

feature "user reviews a sitter", %(
  As a user of the website
  I want to write a review of a dog sitter
  So other dog owners can learn of my prior experiences with the sitter
) do

  scenario "authenticated user successfully writes a review of a sitter" do
    sitter = FactoryGirl.create(:user, sitter: true)
    user = FactoryGirl.create(:user, first_name: "Paul", sitter: false)
    review_desc = "John was wonderful to our dog, Fritz! He sent us updates daily and\
                  even shared photos of Fritz playing with his dog. We definitely felt\
                  at ease knowing Fritz was in good hands."

    sign_in_as(user)

    visit sitter_path(sitter)

    select("5", from: "Rating")
    fill_in "Review", with: review_desc

    click_on "Add Review"

    expect(page).to have_content("Review added successfully.")
    expect(page).to have_content("5")
    expect(page).to have_content(review_desc)
  end

end
