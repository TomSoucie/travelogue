require 'rails_helper'

RSpec.feature "admin creates a category" do

  before do
    @admin = create(:user, role: 'admin')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  scenario "admin user can navigate to a new category page" do

    visit new_admin_category_path

    expect(page).to have_content("New Category")
  end

  scenario "admin user can create a new category" do

    visit new_admin_category_path

    fill_in "Name", with: "Weekend"
    fill_in "Description", with: "A trip 2-3 days in duration"
    click_on "Submit"

    expect(page).to have_content("Category created successfully")
    expect(page).to have_content("New Category Created")
    expect(page).to have_content("Weekend")
  end
end
