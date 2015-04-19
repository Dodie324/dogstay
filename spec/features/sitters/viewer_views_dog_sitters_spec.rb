require "rails_helper"


feature "visitor views a list of dog sitters", %(
  As a viewer
  I want to view a list of dog sitters in my city
  So I can find someone to look after my dog.
) do

  scenario "visitor sees all available sitters in their city" do
    sitter = FactoryGirl.create(:sitter)

    visit '/sitters?location=Boston'

    expect(page).to have_content(sitter.first_name)
    expect(page).to have_content(sitter.headline)
    expect(page).to have_content(sitter.city)
    expect(page).to have_content(sitter.state)
  end

  scenario "visitor views sitter's details" do
    sitter = FactoryGirl.create(:sitter)

    visit '/sitters?location=Boston'

    expect(page).to have_content(sitter.first_name)
    expect(page).to have_content(sitter.headline)
    expect(page).to have_content(sitter.city)
    expect(page).to have_content(sitter.state)

    click_on sitter.first_name

    expect(page).to have_content(sitter.first_name)
    expect(page).to have_content(sitter.headline)
    expect(page).to have_content(sitter.city)
    expect(page).to have_content(sitter.state)
    expect(page).to have_content(sitter.zipcode)
    expect(page).to have_content(sitter.description)
    expect(page).to have_content(sitter.property_type)
    expect(page).to have_content(sitter.yard_type)
    expect(page).to have_content("No")
    expect(page).to have_content("No")
  end

  scenario "visitor doesn't provide a search location" do

    visit root_path

    find("button.icon i.fa").click

    expect(page).to have_content("Please set location")
  end
end
