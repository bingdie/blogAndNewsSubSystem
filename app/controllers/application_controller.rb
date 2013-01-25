class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :authorize_type
  protect_from_forgery

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to "/welcome/load", :notice => "please log in"
    end
  end

  def authorize_type
    unless session[:user].user_type == 2
      redirect_to "/welcome/load", :notice => "please log in"
    end
  end
end
