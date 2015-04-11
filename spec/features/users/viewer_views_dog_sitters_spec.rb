require "rails_helper"

feature "visitor views a list of dog sitters", %(
  As a viewer
  I want to view a list of dog sitters in my city
  So I can find someone to look after my dog.
) do

  scenario "visitor sees all available sitters in their city" do
    sitter = FactoryGirl.create(:user, sitter: true)

    visit root_path

    within("#myform"){
      fill_in "address", with: "Boston"
    }

    click_on "Go"

    expect(page).to have_content(sitter.first_name)
    expect(page).to have_content(sitter.headline)
    expect(page).to have_content(sitter.city)
    expect(page).to have_content(sitter.state)
    expect(page).to have_content(sitter.zipcode)
  end

  # scenario "visitor doesn't provide a search location"
  #   sitter = FactoryGirl.create(:user, sitter: true)

  #   visit root_path

  #   within("#myform"){
  #     fill_in "address", with: ""
  #   }

  #   click_on "Go"

  #   expect(page).to have_content()
end
