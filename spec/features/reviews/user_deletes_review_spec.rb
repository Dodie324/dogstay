require "rails_helper"

feature "user deletes their review", %(
  As the original reviewer
  I want to be able to my review of a sitter
  So that it no longer exists.
) do

  scenario "user successfully deletes their review" do
    sitter = FactoryGirl.create(:sitter)
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    sign_in_as(user)

    visit sitter_path(sitter)

    click_on "Add a review"

    find(:xpath, "//input[@id='review_rating']").set "5"
    fill_in "text-area", with: review.body

    click_on "Add Review"

    expect(page).to have_content("Review added successfully.")
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.body)

    find(:xpath, ".//a/i[@class='fi-x']").click
  end

  scenario "sitter cannot delete review" do
    sitter = FactoryGirl.create(:sitter)
    FactoryGirl.create(:review)

    sign_in_as(sitter)

    visit sitter_path(sitter)

    expect(page).to_not have_content(:xpath, ".//a/i[@class='fi-x']")
  end
end
