require 'rails_helper'

RSpec.describe "Admin::Tags", type: :request do
  describe "GET /index" do
    xit "returns http success" do
      get "/admin/tags/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    xit "returns http success" do
      get "/admin/tags/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    xit "returns http success" do
      get "/admin/tags/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    xit "returns http success" do
      get "/admin/tags/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    xit "returns http success" do
      get "/admin/tags/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    xit "returns http success" do
      get "/admin/tags/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
