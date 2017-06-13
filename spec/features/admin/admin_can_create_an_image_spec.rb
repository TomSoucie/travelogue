require 'rails_helper'

RSpec.feature "admin can create an image" do
  scenario "administrator can navigate to new image page" do
    administrator = User.create(name: "Tom Soucie", email: "ts@gmail.com",
      password: "pass5", role: 1)
    # image = Image.create!(description: "Adventure", url: "https://wpassets.trainingpeaks.com/wp-content/uploads/2016/09/19153513/bikepacking-training-preparation-700x394.jpg")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_image_path

    expect(page).to have_content("New Image")
  end
  scenario "administrator can create an image with a description and url" do
    administrator = User.create(name: "Tom Soucie", email: "ts@gmail.com",
      password: "pass5", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_image_path

    fill_in "Description", with: "Adventure"
    fill_in "url", with: "https://wpassets.trainingpeaks.com/wp-content/uploads/2016/09/19153513/bikepacking-training-preparation-700x394.jpg"
    click_on "Submit"

    expect(page).to have_content("Image created successfully!")
    expect(page).to have_content("Adventure")
  end
end
