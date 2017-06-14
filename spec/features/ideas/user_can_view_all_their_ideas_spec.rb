require 'rails_helper'

RSpec.feature "user can view all their ideas" do
  xscenario "user has ideas and can view them" do
    let!(:idea_1) {create(:idea)}
    let!(:idea_2) {create(:idea)}
    let!(:idea_3) {create(:idea)}

    visit ideas_path

    expect(page).to have_content(idea_1.title)
    expect(page).to have_content(idea_2.title)
    expect(page).to have_content(idea_3.title)
  end
end
