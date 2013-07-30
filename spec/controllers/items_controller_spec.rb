require 'spec_helper'

describe ItemsController do

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.body.should_not be_nil
    end
  end

end
