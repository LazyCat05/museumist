require 'rails_helper'

feature 'admin user accesses genre admin functionality', %Q{
  As an authorized user,
  I want to try and access genre admin functionality
} do
  scenario 'attempt accessing admin_genres_path' do
    visit admin_genres_path

    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to_not have_content('Sign Out')
    expect(page).to_not have_content('Admin Console')
  end

  scenario 'specify valid credentials' do
    user = FactoryBot.create(:user, role: "admin")

    visit admin_genres_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Admin Console')

    click_link 'Admin Console'

    expect(page).to have_content('Genre Admin Functions')
    expect(page).to have_content('Museum Admin Functions')
    expect(page).to have_content('User Admin Functions')

    click_link 'Genre Admin Functions'

    expect(page).to have_content('Museumist Genres')
    expect(page).to have_content('Add a Genre')
  end
end
