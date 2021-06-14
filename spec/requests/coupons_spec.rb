require 'rails_helper'

RSpec.describe "Coupons", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/coupons/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/coupons/show"
      expect(response).to have_http_status(:success)
    end
  end

end
