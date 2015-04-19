require "rails_helper"

feature "sitter edits profile", %(
  As a sitter
  I want to update my profle
  So I can make new changes.
) do

  scenario "sitter edits their profile" do
    sitter = FactoryGirl.create(:sitter)

    sign_in_as(sitter)

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Edit Profile')
    expect(page).to have_content('Sign Out')

    click_on 'Edit Profile'
  end
end
