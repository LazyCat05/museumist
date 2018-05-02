require 'rails_helper'

feature 'user sees profile picture', %Q{
  As a user
  I want to see my profile picture depending on my sign in
} do
  scenario 'no specified valid credentials' do
    visit root_path

    expect(page).to have_content('Museumist')
    expect(page).to have_no_selector('img')
  end
  scenario 'specify valid credentials' do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
    expect(page).to have_selector('img')
  end

end
