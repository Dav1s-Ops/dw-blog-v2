require 'rails_helper'

RSpec.describe "Admin::Posts", type: :request do
  let(:user) { User.create(email: 'blogboy@example.com', password: 'password') }
  let(:post) { Post.create(title: 'First Post', content: 'Content', status: 'publish', user: user) }
  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get admin_posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/posts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/posts/#{post.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
