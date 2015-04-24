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

    click_on "Share photos!"

    attach_file("image_image_upload",
     "#{Rails.root}/spec/fixtures/fritz.jpg")

    click_on "Upload"

    expect(page).to have_content("Image added successfully.")
  end

  scenario "sitter unsuccessfully uploads a new image" do
    sitter = FactoryGirl.create(:sitter)

    sign_in_as(sitter)

    visit sitter_path(sitter)

    click_on "Share photos!"

    click_on "Upload"

    expect(page).to have_content("You must upload an image.")
  end

  scenario "sitter uploads a wrong image type" do
    sitter = FactoryGirl.create(:sitter)

    sign_in_as(sitter)

    visit sitter_path(sitter)

    click_on "Share photos!"

    attach_file("image_image_upload",
     "#{Rails.root}/spec/fixtures/test.txt")

    click_on "Upload"

    expect(page).to have_content("Image not added.")
  end

  scenario "sitter cannot upload images on another sitter's page" do
    sitter = FactoryGirl.create(:sitter)
    sitter_2 = FactoryGirl.create(
      :sitter,
      email: "randomsitter@dogstay.com",
      phone_number: "2329232421",
      first_name: "David",
      last_name: "Rodriguez"
      )

    sign_in_as(sitter)

    visit sitter_path(sitter_2)

    expect(page).not_to have_content("Share photos!")
  end
end
