require 'rails_helper'

RSpec.feature "user can create a new idea" do
  scenario "user logs in and can create a new idea" do

    visit login_path

    within("form") do
      fill_in "Email", with: registered.email
      fill_in "Password", with: registered.password
      click_on "Login"
    end

    # expect(current_path).to eq('/ideas')
    click_on "New Idea"

    within ("form") do
      fill_in "Title", with: "Daycation to Morrision"
      fill_in "Description", with: "Take the SUPs up to Soda Lakes and have Brunch in Morrison"
      fill_in "Category", with: "Day Trip"
      # fill_in "Photo", with: "photo_selection"
      click_on "Submit"
    end

    expect(page).to have_current_path("users/#{user.id}")
    expect(page).to have_content("Daycation to Morrision")
    # expect(page).to have_css(img[src=*"photo selection"])
  end
end
