require 'rails_helper'

RSpec.feature "User wants to log into application" do
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
    expect(page).to have_content("Welcome Donald Roberts")
    expect(page).to have_content("Logout")
  end

  scenario "a user enters the wrong password" do
    registered = User.create(name: "Donald Roberts",
      email: "dr@gmail.com", password: "passw", role: 0)

    visit login_path

    within("form") do
      fill_in "Email", with: registered.email
      fill_in "Password", with: "asdr"
      click_on "Login"
    end
    expect(page).to_not have_content("Successfully logged in")
    expect(current_path).to eq('/login')
  end
end
