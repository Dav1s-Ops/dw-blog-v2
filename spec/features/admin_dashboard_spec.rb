require 'rails_helper'

RSpec.feature "AdminDashboard", type: :feature do
  let(:user) { User.create(email: 'blogboy@example.com', password: 'password') }
  before do
    sign_in user
  end

  scenario "User sees dashboard stats" do
    visit admin_dashboard_path

    expect(page).to have_content('Total Posts')
    expect(page).to have_content('Total Categories')
    expect(page).to have_content('Total Tags')
    expect(page).to have_content('Draft Posts')
  end

  scenario "User sees posts by category" do
    visit admin_dashboard_path

    expect(page).to have_content('Posts by Category')
  end
end