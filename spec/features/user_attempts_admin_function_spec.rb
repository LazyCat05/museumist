require 'rails_helper'

feature 'user attempts to access admin functionality', %Q{
  As an authorized user,
  I want to try and access admin functionality
} do
  scenario 'specify invalid credentials' do
    visit new_user_session_path

    click_button 'Log in'
    expect(page).to have_content('Invalid Username or password')
    expect(page).to_not have_content('Sign Out')
    expect(page).to_not have_content('Admin Functions')
  end

  scenario 'attempt accessing admin root path' do
    visit admin_root_path

    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to_not have_content('Sign Out')
    expect(page).to_not have_content('Admin Functions')
  end

  scenario 'specify valid credentials' do
    user = FactoryBot.create(:user, role: "admin")

    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Admin Functions')

    click_link 'Admin Functions'

    expect(page).to have_content('Genre Admin Functions')
    expect(page).to have_content('Museum Admin Functions')
    expect(page).to have_content('User Admin Functions')
  end
end
