require 'rails_helper'

RSpec.describe "Admin::Categories", type: :request do
  describe "GET /index" do
    xit "returns http success" do
      get "/admin/categories/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    xit "returns http success" do
      get "/admin/categories/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    xit "returns http success" do
      get "/admin/categories/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    xit "returns http success" do
      get "/admin/categories/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    xit "returns http success" do
      get "/admin/categories/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    xit "returns http success" do
      get "/admin/categories/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
