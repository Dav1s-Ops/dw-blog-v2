require 'rails_helper'

RSpec.describe "Admin::Dashboards", type: :request do
  describe "GET /index" do
    xit "returns http success" do
      get "/admin/dashboard"
      expect(response).to have_http_status(:success)
    end
  end

end
