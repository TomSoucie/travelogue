require 'rails_helper'

RSpec.feature "User can log in as admin" do

  scenario "an admin user can log in as admin" do
    visit login_path
  end

  # scenario "an admin user can view the categories index" do

end
