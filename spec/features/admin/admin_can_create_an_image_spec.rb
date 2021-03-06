require 'rails_helper'

RSpec.feature "admin can create an image" do

  before do
    @admin = create(:user, role: 'admin')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  scenario "admin user can navigate to a new image page" do

    visit new_admin_image_path

    expect(page).to have_content("New Image")
  end

  scenario "administrator can add an image" do

    visit new_admin_image_path

    fill_in "Description", with: "Adventure"
    # fill_in "url", with: "https://wpassets.trainingpeaks.com/wp-content/uploads/2016/09/19153513/bikepacking-training-preparation-700x394.jpg"
    click_on "Create"

    expect(page).to have_content("Image created successfully")
    expect(page).to have_content("Adventure")
  end
end
