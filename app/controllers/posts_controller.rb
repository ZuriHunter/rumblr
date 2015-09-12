class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    user_ids = current_user.timeline_user_ids
    @post = Post.where(user_id: user_id).order.("Created at DESC")
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
 
end
