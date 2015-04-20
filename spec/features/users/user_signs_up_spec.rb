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
    user = FactoryGirl.create(:user)

    visit new_user_registration_path

    fill_in 'Email', with: "random@email.com"
    fill_in 'Password', with: user.password
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Phone number', with: "3489991237"
    fill_in 'Zipcode', with: user.zipcode
    attach_file("user_image",
      "#{Rails.root}/spec/fixtures/fritz.jpg")
    select 'No', from: "Would you like to house a dog?"

    click_button 'Sign Up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Edit Profile')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide valid registration information as dog sitter' do
    sitter = FactoryGirl.create(:sitter)

    visit new_user_registration_path

    fill_in 'Email', with: "sitter@random.com"
    fill_in 'Password', with: sitter.password
    fill_in 'First name', with: sitter.first_name
    fill_in 'Last name', with: sitter.last_name
    fill_in 'Phone number', with: "2384883980"
    fill_in 'Zipcode', with: sitter.zipcode
    attach_file("user_image",
      "#{Rails.root}/spec/fixtures/fritz.jpg")
    select 'Yes', from: "Would you like to house a dog?"
    fill_in 'Headline', with: sitter.headline
    fill_in 'Description', with: sitter.description
    select 'Yes', from: "Do you have any dogs?"
    select 'No', from: "Do you have any children?"
    select 'House', from: "Property type"
    select 'Fenced', from: "Type of yard"
    fill_in 'Price', with: sitter.price
    select 'Weekends', from: "Time available"
    fill_in 'Address1', with: sitter.address1
    fill_in 'City', with: sitter.city
    select 'MA', from: "State"

    click_button 'Sign Up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Edit Profile')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'Sign Up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
    expect(page).to_not have_content('Edit Profile')
  end

  scenario 'provide invalid image file type' do
    sitter = FactoryGirl.create(:sitter)

    visit new_user_registration_path

    fill_in 'Email', with: "sitter@random.com"
    fill_in 'Password', with: sitter.password
    fill_in 'First name', with: sitter.first_name
    fill_in 'Last name', with: sitter.last_name
    fill_in 'Phone number', with: "2384883980"
    fill_in 'Zipcode', with: sitter.zipcode
    attach_file("user_image",
      "#{Rails.root}/spec/fixtures/test.txt")
    select 'Yes', from: "Would you like to house a dog?"
    fill_in 'Headline', with: sitter.headline
    fill_in 'Description', with: sitter.description
    select 'Yes', from: "Do you have any dogs?"
    select 'No', from: "Do you have any children?"
    select 'House', from: "Property type"
    select 'Fenced', from: "Type of yard"
    fill_in 'Price', with: sitter.price
    select 'Weekends', from: "Time available"
    fill_in 'Address1', with: sitter.address1
    fill_in 'City', with: sitter.city
    select 'MA', from: "State"

    click_button 'Sign Up'
    expect(page).to have_content("allowed types: jpg, jpeg, gif, png")
    expect(page).to_not have_content('Sign Out')
    expect(page).to_not have_content('Edit Profile')
  end
end
