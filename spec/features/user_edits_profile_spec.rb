require 'rails_helper'

feature 'user edits profile' do
  scenario 'clicking username brings user to edit page' do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit root_path

    expect(page).to have_content(user.username)
    click_link(user.username)

    expect(page).to have_content('Update Profile')
  end

  scenario 'user changes username' do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit edit_user_registration_path

    fill_in 'Username', with: 'newusername'
    fill_in 'Current password', with: user.password


    click_button 'Update'

    expect(page).to have_content('Your profile has been updated successfully.')
  end
end
