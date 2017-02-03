require 'rails_helper'

describe SessionsController do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  describe "create" do
    it "should create a user" do
      post :create

      expect(User.count).to eq(1)
    end

    it "should create the session" do
      expect(session[:user_id]).to be_nil
      post :create
      expect(session[:user_id]).to_not be_nil
    end
  end

  describe "destroy" do
    before do
      post :create
    end

    it "should clear the session" do
      expect(session[:user_id]).to_not be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end
