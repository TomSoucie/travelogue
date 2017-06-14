require 'rails_helper'

RSpec.feature "User creates new account" do
  scenario "an unregistered user can sign up for a new account" do
    visit new_user_path

    expect(page).to have_content("Sign up for new Account")

    fill_in "Name", with: "Donald Roberts"
    fill_in "Email", with: "dr@gmail.com"
    fill_in "Password", with: "passw"
    click_on "Register User"

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Welcome Donald Roberts")
  end
end
