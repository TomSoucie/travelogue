require 'rails_helper'

RSpec.feature "user can view a single idea" do
  let!(:idea_1) {create(:idea)}
  let!(:idea_2) {create(:idea)}
  let!(:idea_3) {create(:idea)}

  scenario "user has ideas and can view a single idea" do
    visit idea_path(idea_1)
    expect(page).to have_content(idea_1.title)
    expect(page).to not_have_content(idea_2.title)
    expect(page).to not_have_content(idea_3.title)

    visit idea_path(idea_2)
    expect(page).to have_content(idea_2.title)
    expect(page).to not_have_content(idea_1.title)
    expect(page).to not_have_content(idea_3.title)

    visit idea_path(idea_3)
    expect(page).to have_content(idea_3.title)
    expect(page).to not_have_content(idea_2.title)
    expect(page).to not_have_content(idea_1.title)
  end
end
