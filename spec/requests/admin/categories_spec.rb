require 'rails_helper'

RSpec.describe "Admin::Categories", type: :request do
  let(:user) { User.create(email: 'blogboy@example.com', password: 'password') }
  let(:category) { Category.create!(name: 'category_name') }
  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get "/admin/categories"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/categories/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/categories/#{category.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
