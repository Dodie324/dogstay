require 'rails_helper'

feature 'user messages sitter', %Q{
  As a signed up user
  I want to message a sitter
  So that I can schedule a time to meet
} do
  scenario 'user succesfully messages sitter' do
    user = FactoryGirl.create(:user)
    sitter = FactoryGirl.create(:sitter)

    sign_in_as(user)

    visit sitter_path(sitter)

    click_on "Send Message"

    fill_in "Subject", with: "When are you available?"
    fill_in "Message", with: "I would like it if you could look after my dog."

    click_on "Send"

    expect(page).to have_content("Message sent.")
  end

  scenario 'user unsuccesfully messages sitter' do
    user = FactoryGirl.create(:user)
    sitter = FactoryGirl.create(:sitter)

    sign_in_as(user)

    visit sitter_path(sitter)

    click_on "Send Message"

    fill_in "Subject", with: ""
    fill_in "Message", with: "I would like it if you could look after my dog."

    click_on "Send"

    expect(page).to have_content("Message could not send.")
  end
end
