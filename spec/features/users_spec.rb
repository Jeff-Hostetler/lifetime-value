require 'rails_helper'
require 'capybara/rails'

feature 'Users' do

  scenario 'Users can see current users' do
    create_user email: "user@example.com"

    visit root_path
    click_on "Login"
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("user@example.com")
    expect(page).to have_content("Current Users")

    click_on "Current Users"

    expect(page).to have_content("Some User")

  end

end
