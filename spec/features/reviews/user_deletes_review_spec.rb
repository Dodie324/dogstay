require "rails_helper"

feature "user deletes their review", %(
  As the original reviewer
  I want to be able to my review of a sitter
  So that it no longer exists.
) do

  # scenario "user successfully deletes their review" do
  #   sitter = FactoryGirl.create(:sitter)
  #   user = FactoryGirl.create(:user)
  #   review = FactoryGirl.create(:review)

  #   sign_in_as(user)

  #   visit sitter_path(sitter)

  #   select("5", from: "Rating")
  #   fill_in "Review", with: review.body

  #   click_on "Add Review"

  #   expect(page).to have_content("Review added successfully.")
  #   expect(page).to have_content(review.rating)
  #   expect(page).to have_content(review.body)

  #   page.first("#review-rating .fi-x").click

  #   expect(page).to have_content("Review deleted.")
  # end

  scenario "sitter cannot delete review" do
    sitter = FactoryGirl.create(:sitter)
    FactoryGirl.create(:review)

    sign_in_as(sitter)

    visit sitter_path(sitter)

    expect(page).to_not have_content("Delete")
  end

  scenario "viewer cannot delete review" do
    sitter = FactoryGirl.create(:sitter)
    FactoryGirl.create(:review)

    visit sitter_path(sitter)

    expect(page).to_not have_content("Delete")
  end
end
