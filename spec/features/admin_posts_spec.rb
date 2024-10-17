require 'rails_helper'

RSpec.feature "AdminPosts", type: :feature do
  let(:user) { User.create(email: 'blogboy@example.com', password: 'password') }
  before do
    sign_in user
    @post1 = Post.create(title: 'First Post', content: 'Content', status: 'publish', user: user)
    @post1 = Post.create(title: 'Second Post', content: 'Content', status: 'publish', user: user)
  end

  scenario "User views paginated posts" do
    visit admin_posts_path

    expect(page).to have_selector('table')
    expect(page).to have_content('First Post')
    expect(page).to have_content('Second Post')
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
  end

  # scenario "User searches for a post" do
  #   visit admin_dashboard_path

  #   fill_in 'Search', with: 'First'
  #   expect(page).to have_content('First Post')
  #   expect(page).not_to have_content('Second Post')
  # end
end