require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to sign in
  So that I can regain access to my account
} do
  scenario 'specify valid credentials' do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Edit Profile')
  end

  scenario 'specify invalid credentials' do
    visit new_user_session_path

    click_button 'Log In'
    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Sign Out')
    expect(page).to_not have_content('Edit Profile')
  end
end
