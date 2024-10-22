require 'rails_helper'

RSpec.describe "Errors", type: :request do
  describe "GET /not_found" do
    it "returns 404 not found" do
      get '/not_found'
      expect(response).to have_http_status(:not_found)
    end
  end
end
