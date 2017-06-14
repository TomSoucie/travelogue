require 'rails_helper'

RSpec.describe "user can edit an idea" do

  before do
      @idea = create_list(:idea, 5)
      @user = create(:user)
      @categories = create_list(:category, 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit ideas_path(@idea)
  end

  scenario "user can select an idea and edit" do
    idea = Idea.all[3]
    visit edit_idea_path(idea)

    within 'form' do
      fill_in "Title", with: "New Title"
      fill_in "Description", with: "New Description"
      click_on "Update"
    end

    expect(page).to have_content("New Title")
    expect(page).to have_content("New Description")
  end
end
