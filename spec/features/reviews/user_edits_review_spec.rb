require "rails_helper"

feature "user edits review", %(
  As the original reviewer
  I want to be able to update a review of a sitter
  So I can correct errors and provide new information.
) do

  scenario "original reviewer successfully edits review" do
    sitter = FactoryGirl.create(:sitter)
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    sign_in_as(user)

    visit sitter_path(sitter)

    select("5", from: "Rating")
    fill_in "Review", with: review.body

    click_on "Add Review"

    expect(page).to have_content("Review added successfully.")
    expect(page).to have_content("1 Review")
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.body)
    expect(page).to have_content(review.created_at.strftime("%d %b. %Y"))

    click_on "Edit"
    select("2", from: "Rating")
    fill_in "Review", with: "I did not have a pleasant experience with John."

    click_on "Edit"

    expect(page).to have_content("1 Review")
    within("#review-rating") do
      expect(page).to have_content("2")
      expect(page).to_not have_content(review.rating)
    end

    within("#review-desc") do
      expect(page).to have_content("I did not have a pleasant experience with John.")
      expect(page).to_not have_content(review.body)
    end
    expect(page).to have_content(review.created_at.strftime("%d %b. %Y"))
  end

  scenario "original reviewer unsuccessfully edits review" do
    user = FactoryGirl.create(:user)
    sitter = FactoryGirl.create(:sitter)
    review = FactoryGirl.create(:review)

    sign_in_as(user)

    visit sitter_path(sitter)

    select("5", from: "Rating")
    fill_in "Review", with: review.body

    click_on "Add Review"

    expect(page).to have_content("Review added successfully.")
    expect(page).to have_content("1 Review")
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.body)
    expect(page).to have_content(review.created_at.strftime("%d %b. %Y"))

    click_on "Edit"

    select("2", from: "Rating")
    fill_in "Review", with: ""
    click_on "Edit"

    expect(page).to have_content("Body can't be blank")
    expect(page).to have_content("Body is too short (minimum is 20 characters)")
  end

  scenario "sitter cannot edit review" do
    user = FactoryGirl.create(:user)
    sitter = FactoryGirl.create(:sitter)
    review = FactoryGirl.create(:review)

    sign_in_as(sitter)

    visit sitter_path(sitter)

    expect(page).to_not have_content("Edit")
  end

  scenario "viewer cannot edit review" do
    sitter = FactoryGirl.create(:sitter)
    review = FactoryGirl.create(:review)

    visit sitter_path(sitter)

    expect(page).to_not have_content("Edit")
  end
end
