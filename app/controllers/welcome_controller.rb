class WelcomeController < ApplicationController
  after_filter :authorize_type_after
  skip_before_filter :authorize, :only => [:fix,:log,:load, :fok]
  skip_before_filter :authorize_type
  skip_after_filter :authorize_type_after, :except =>:log
  def index
  end

  def go

  end

  def do

  end

  def dialog

  end

  def close

  end

  def fix
    if session[:user_id] != nil
      render "/welcome/log"
    end
  end
     #管理员登录
  def log

    if user = User.authenticate(params[:name],params[:password]) || session[:user_id] != nil
      unless session[:user_id]
        session[:user] = user
        session[:user_id] = user.id
      end
      redirect_to news_cates_url
    else
      redirect_to "/welcome/fix", :alt => 'username or password is error'
    end
  end

  def load
    if session[:user_id] != nil
      render "/welcome/fok"
    end
  end
   #用户登录
  def fok
    if user = User.authenticate(params[:name],params[:password]) || session[:user_id] != nil
      unless session[:user_id]
        session[:user] = user
        session[:user_id] = user.id
      end
    else
      redirect_to "/welcome/load", :alt => 'username or password is error'
    end

  end

  def sub

  end

  def cate

  end

  def logout1
    session[:user_id] = nil
    redirect_to "/welcome/fix", :notice => "Logged out"
  end

  def logout2
    session[:user_id] = nil
    redirect_to "/welcome/load", :notice => "Logged out"
  end

  private
  def authorize_type_after
    unless session[:user].user_type == 2
      redirect_to "/welcome/load", :notice => "your not Manager"
    end

  end

end
