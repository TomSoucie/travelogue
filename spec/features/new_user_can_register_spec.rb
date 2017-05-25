require 'rails_helper'

=begin
As a visitor
When I visit the login page
And I fill_in my name in the name field
And I fill_in a unique email in the email field
And I fill_in the password field
And I click_on "Register User"

I should expect the path to be user_path(User.last)
I should expect the page to have flash and welcome message
=end

RSpec.feature "Visitor can register to become a user" do
  scenario "an unregistered visitor can register as a user" do
    visit new_user_path

    expect(page).to have_content("Sign up for new Account")

    fill_in "Name", with: "Donald Roberts"
    fill_in "Email", with: "dr@gmail.com"
    fill_in "Password", with: "passw"
    click_on "Register User"

    expect(current_path).to eq(user_path(User.last))
    # expect(page).to have_content("Successfully Logged In!")
    expect(page).to have_content("Welcome Donald Roberts")
  end
end
