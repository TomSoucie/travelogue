require 'rails_helper'

RSpec.feature "Admin creates a category" do
  scenario "admin user can navigate to a new category page" do
    admin = User.create(name: "Tom Soucie", email: "ts@gmail.com",
      password: "pass5", role: 1)

    visit new_admin_category_path

    expect(page).to have_content("New Category")
  end

  # scenario "admin user can create a new category" do
  #   admin = User.create(name: "Tom Soucie", email: "ts@gmail.com",
  #     password: "pass5", role: 1)
  #
  #   visit new_category_path
  #   click_on "New Category"
  #   within("form") do
  #     fill_in "Name", with: "Weekend"
  #     fill_in "Description", with: "A trip 2-3 days in duration"
  #     click_on "Submit"
  #   end
  #   expect(page).to have_content("New Category Created")
  #   expect(page).to have_content("Weekend")
  # end
end
