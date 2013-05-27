require 'spec_helper'

describe HomeController do
  render_views

  describe "GET 'index'" do
    let(:user) { FactoryGirl.create(:user) }

    context "when logged in" do
      before(:each) do
        test_sign_in user
      end

      it "returns http success" do
        get :index
        expect(response).to be_success
      end

      it "shows the users full name" do
        get :index
        expect(response.body).to have_content(user.name)
      end

      it "shows a logout link" do
        get :index
        expect(response.body).to have_content("logout")
      end

    end

    context "when not logged in" do

      it "renders the login page" do
        get :index
        expect(response).to redirect_to(root_path)
      end

    end

  end

end
