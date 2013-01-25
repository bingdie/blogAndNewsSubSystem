class CommentsController < ApplicationController
  http_basic_authenticate_with :name => "zjn", :password => "zjn", :only => :destroy
  def create
    @post = Post.find(params[:post_id])
    #@comment = @post.comments.create(params[:comment])
    @comment = Comment.new(params[:comment])
    @comment.post = @post
    @comment.user = session[:user]
  #  @comment.update_attributes(@comment)
    if @comment.save
       redirect_to post_path(@post)
    else
      redirect_to login_url
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)

  end
end
