require 'rails_helper'

RSpec.feature "user can create a new idea" do
  before do
    @user = create(:user)
    @categories = create_list(:category, 3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  xscenario "user creates idea" do

    visit new_idea_path

    expect(current_path).to eq('/ideas/new')

    within ("form") do
      fill_in "Title", with: "Daycation to Morrison"
      fill_in "Description", with: "Take the SUPs up to Soda Lakes and have Brunch in Morrison"
      select 'Trip3', from: @categories[0].name
      # fill_in "url", with: "https://c1.staticflickr.com/9/8582/28567087656_ad5401240e_k.jpg"
      click_on "Create"
    end

    expect(page).to have_current_path(ideas_path)
    expect(page).to have_content("Daycation to Morrison")
    expect(page).to have_content("Idea created successfully")
  end
end
