class SessionsController < ApplicationController
  skip_before_filter :authorize, :only => [:new,:create]
  def new
  end

  def create
      if user = User.authenticate(params[:name],params[:password])
        session[:user] = user
        session[:user_id] = user.id
        redirect_to admin_url
        #render "/welcome/log"
      else
        redirect_to login_url, :alt => 'username or password is error'
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path, :notice => "Logged out"
  end
end
