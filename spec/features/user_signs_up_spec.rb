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

  scenario 'provide valid registration information' do
    visit root_path

    click_link('Sign Up')

    expect(page).to have_content('Sign up')

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Username', with: 'exampleuser'
    fill_in 'First Name', with: 'john'
    fill_in 'Last Name', with: 'example'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end
end

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path

    click_link('Sign Up')

    expect(page).to have_content('Sign up')

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Username', with: 'exampleuser'
    fill_in 'First Name', with: 'john'
    fill_in 'Last Name', with: 'example'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    attach_file :user_profile_photo, "#{Rails.root}/spec/support/images/photo.png"

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_css("img[src*='photo.png']")
  end
end
