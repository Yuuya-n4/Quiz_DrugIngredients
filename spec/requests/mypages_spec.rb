require 'rails_helper'

RSpec.describe "Mypages", type: :request do
  describe "GET /profile" do
    it "returns http success" do
      get "/mypages/profile"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /scores" do
    it "returns http success" do
      get "/mypages/scores"
      expect(response).to have_http_status(:success)
    end
  end

end
