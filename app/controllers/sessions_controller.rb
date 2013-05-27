class SessionsController < ApplicationController

  before_filter :authenticate, :only => :destroy

  def new
    redirect_to home_path if signed_in?
  end

  def create
    #This is left in for debugging purposes
    #raise request.env["omniauth.auth"].to_yaml

    auth = request.env["omniauth.auth"]
    user = User.from_omniauth(auth)

    sign_in user
    redirect_to home_path, :notice => "Signed in!"

  end

  def destroy
    sign_out
    redirect_to root_path, :notice => "Signed out!"
  end

  def failure
    msg = if request["error"]
            request["error"].humanize
          else
            "There was an error processing your request."
          end

    redirect_to root_path, :flash => { :error => msg }
  end

end

