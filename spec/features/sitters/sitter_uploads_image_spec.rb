require "rails_helper"

feature "sitter uploads photos", %(
  As a sitter
  I want to upload images of the dogs I house
  So other users can see what their experience is like.
) do

  scenario "sitter successfully uploads a new image" do
    sitter = FactoryGirl.create(:sitter)

    sign_in_as(sitter)

    visit sitter_path(sitter)

    attach_file("image_image",
     "#{Rails.root}/spec/fixtures/fritz.jpg")

    click_on "Upload"

    expect(page).to have_content("Image added successfully.")
  end

  scenario "sitter unsuccessfully uploads a new image" do
    sitter = FactoryGirl.create(:sitter)

    sign_in_as(sitter)

    visit sitter_path(sitter)

    click_on "Upload"

    expect(page).to have_content("Image not added.")
  end

end
