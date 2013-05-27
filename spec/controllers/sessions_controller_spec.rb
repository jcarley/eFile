require 'spec_helper'

describe SessionsController do
  render_views

  context "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do

    context "when signing in with Google" do

      let(:auth) {
        auth_hash = {
          :provider => 'google_oauth2',
          :uid => '104764711188761852123',
          :info => {
            email: 'jjones@example.com',
            name: 'Jay Jones',
            first_name: 'Jay',
            last_name: 'Jones',
            image: 'https://lh3.googleusercontent.com/-SB5SiryelTs/AAAAAAAAAAI/AAAAAAAAF4o/5uqQK9y0hz0/photo.jpg'
          }.stringify_keys!,
          :credentials => {
            token: 'ya29.AHES6ZRgx39sgXxhkldjXk7lYjTF9OJ5v6EYERWtiPaibeRwRQBdKrIi',
            expires_at: 1340716313
          }.stringify_keys!
        }.stringify_keys!
      }

      let(:user) { User.from_omniauth(auth) }

      it "should be successful" do
        post :create, request.env["omniauth.auth"] = auth
        controller.should be_signed_in
        controller.current_user.provider.should eq("google_oauth2")
      end

      it "should update user info with updated profile" do
        updated_auth = auth
        updated_auth["info"]["email"] = "john.doe@example.com"
        post :create, request.env["omniauth.auth"] = updated_auth
        controller.current_user.email.should eq(updated_auth["info"]["email"])
      end

      it "should redirect to landing page after signin" do
        post :create, request.env["omniauth.auth"] = auth
        response.should redirect_to(home_path)
      end

    end

    context "when canceling the authorization request" do

      let(:auth) {
        {"error_reason"=>"user_denied",
         "error"=>"access_denied",
         "error_description"=>"The user denied your request."}
      }

      it "should not sign in a user" do
        post :failure, auth
        controller.should_not be_signed_in
        response.should redirect_to(root_path)
        flash[:error].should =~ /Access denied/i
      end

    end

  end

  describe "DELETE 'destroy'" do

    it "should signout a user" do
      test_sign_in(FactoryGirl.create(:user))
      delete :destroy
      controller.should_not be_signed_in
      response.should redirect_to(root_path)
    end

  end

  describe "POST 'failure'" do

    it "should not sign a user in" do
      post :failure
      controller.should_not be_signed_in
      response.should redirect_to(root_path)
      flash[:error].should =~ /There was an error processing your request/i
    end

  end


end

