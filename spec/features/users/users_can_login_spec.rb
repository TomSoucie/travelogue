require 'rails_helper'

RSpec.feature "User visits login page" do
  scenario "a user can log in" do
    registered = User.create(name: "Donald Roberts",
      email: "dr@gmail.com", password: "passw", role: 0)

    visit login_path
    expect(page).to have_content("Not registered? Sign Up Here!")
    within("form") do
      fill_in "Email", with: registered.email
      fill_in "Password", with: registered.password
      click_on "Login"
    end

    expect(page).to have_content("Successfully logged in")
    expect(page).to have_content("Welcome Donald")
    expect(page).to have_content("Logout")

    end
end
