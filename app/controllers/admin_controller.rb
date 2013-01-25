class AdminController < ApplicationController
  #skip_before_filter :authorize
  def index
    @posts = User.find_by_id(session[:user_id]).posts
  end
end
