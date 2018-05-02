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

feature "profile photo" do
  scenario "user uploads a profile photo" do
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit edit_user_registration_path

    fill_in 'Username', with: 'newusername'
    fill_in 'Current password', with: user.password
    attach_file :user_profile_photo, "#{Rails.root}/spec/support/images/photo.png"
    click_button "Update"
    expect(page).to have_content("Your profile has been updated successfully.")
    expect(page).to have_css("img[src*='photo.png']")
  end
end
