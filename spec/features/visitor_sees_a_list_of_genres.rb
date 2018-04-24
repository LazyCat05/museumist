require 'rails_helper'

feature "visitor sees a list of genres" do
  scenario "sees a list of genres and a link for each genre" do
    science = Genre.create(name: 'Science')

    visit genres_path

    expect(page).to have_content "Science"
    expect(page).to have_link "Science"

  end
end
