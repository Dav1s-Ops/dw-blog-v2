require 'rails_helper'

RSpec.describe "Admin::Tags", type: :request do
  let(:user) { User.create(email: 'blogboy@example.com', password: 'password') }
  let(:tag) { Tag.create(name: 'tag_name') }
  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get "/admin/tags"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/tags/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/tags/#{tag.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end
end
