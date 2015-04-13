require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
} do

  # Acceptance Criteria:
  # * I must specify a valid email address,
  #   password, and password confirmation
  # * If I don't specify the required information, I am presented with
  #   an error message

  scenario 'provide valid registration information as regular user' do
    visit new_user_registration_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Phone number', with: '5555555555'
    fill_in 'Address1', with: '33 Harrison Ave'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'MA'
    fill_in 'Zipcode', with: '02111'
    fill_in 'Headline', with: 'I LOVE DOGS!'
    fill_in 'Description', with: 'I hope to find dog lovers who can house my dog when I am away fro the weekend'
    select 'No', from: 'Would you like to house a dog?'
    select 'Yes', from: 'Do you have any dogs?'
    select 'No', from: 'Do you have any children?'
    select 'Apartment', from: 'Property type'
    select 'None', from: 'Type of yard'

    click_button 'SIGN UP'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('SIGN OUT')
  end

  scenario 'provide valid registration information as dog sitter' do
    visit new_user_registration_path

    fill_in 'Email', with: 'john1@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Phone number', with: '5555555555'
    fill_in 'Address1', with: '33 Harrison Ave'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'MA'
    fill_in 'Zipcode', with: '02111'
    fill_in 'Headline', with: 'I LOVE DOGS!'
    fill_in 'Description', with: 'I have been a dog owner for 20 years! I would be happy to house your dog!'
    select 'Yes', from: 'Would you like to house a dog?'
    select 'Yes', from: 'Do you have any dogs?'
    select 'No', from: 'Do you have any children?'
    select 'House', from: 'Property type'
    select 'Fenced', from: 'Type of yard'

    click_button 'SIGN UP'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('SIGN OUT')
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'SIGN UP'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('SIGN OUT')
  end
end
