require 'rails_helper'

RSpec.feature "UserAuthentication", type: :feature do
  let(:user) { User.create(email: 'blogboy@example.com', password: 'password') }

  scenario "User logs in successfully" do
    visit new_user_session_path
    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_button('Logout')
    expect(current_path).to eq(admin_dashboard_path)
  end

  scenario "User logs out successfully" do
    sign_in user
    visit admin_dashboard_path
    
    click_button 'Logout'
    
    expect(page).to have_content('Signed out successfully')
    expect(current_path).to eq(posts_path)
  end
end