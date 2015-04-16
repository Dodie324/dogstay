require "rails_helper"

feature "user reviews a sitter", %(
  As a user of the website
  I want to write a review of a dog sitter
  So other dog owners can learn of my prior experiences with the sitter
) do

  scenario "authenticated user successfully writes a review" do
    sitter = FactoryGirl.create(:sitter)
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    sign_in_as(user)

    visit sitter_path(sitter)

    click_on "Add a review"

    select("5", from: "Rating")
    fill_in "Review", with: review.body

    click_on "Add Review"

    expect(page).to have_content("Review added successfully.")
    expect(page).to have_content("1 Review")
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.body)
    expect(page).to have_content(review.created_at.strftime("%d %b. %Y"))
  end

  scenario "authenticated user unsuccessfully writes a review" do
    sitter = FactoryGirl.create(:sitter)
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit sitter_path(sitter)

    click_on "Add a review"

    click_on "Add Review"

    expect(page).to have_content("Rating can't be blank")
    expect(page).to have_content("Rating is not included in the list")
    expect(page).to have_content("Body can't be blank")
  end

  scenario "authenticated user doesn't submit valid review body" do
    sitter = FactoryGirl.create(:sitter)
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit sitter_path(sitter)

    click_on "Add a review"

    select("5", from: "Rating")
    fill_in "Review", with: "The best"

    click_on "Add Review"

    expect(page).to have_content("Body is too short (minimum is 20 characters)")
  end

  scenario "a viewer attempts to review a sitter" do
    sitter = FactoryGirl.create(:sitter)
    review_desc = "John was wonderful to our dog, Fritz! He sent us updates daily and\
              even shared photos of Fritz playing with his dog. We definitely felt\
              at ease knowing Fritz was in good hands."

    visit sitter_path(sitter)

    expect(page).to_not have_content("Add a review")
  end

end
