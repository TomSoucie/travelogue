require 'rails_helper'

RSpec.feature "admin can log in as admin" do
  scenario "an admin user can log in as admin" do
    admin = create(:user, role: :admin)

    visit('/login')

    within("form") do
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_on "Login"
    end

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Successfully Logged in as admin")
    expect(page).to have_content("Logout")
  end
end
