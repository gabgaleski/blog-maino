class CommentsController < ApplicationController
  before_action :set_post

  def create
    if Current.user
      @post.comments.create! params.require(:comment).permit(:content).merge(user: Current.user)
    else
      @post.comments.create! params.require(:comment).permit(:content)
    end
    redirect_to @post
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
end
