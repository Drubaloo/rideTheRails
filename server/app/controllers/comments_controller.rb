class CommentsController < ApplicationController
  def index
    belongs_to :user
    belongs_to :commentable, polymorphic: true

    validates :body, presence: true
  end

  def create 
    post = Post.find_by(id: params[:post_id])
    puts post
    user = User.find_by(id: session[:user_id].to_i)
    puts user
  
    comment = Comment.new(body: params[:body], commentable: post, user: user)
  
    if comment.save
      render plain: "success"
    else
      render plain: "failure"
      puts comment.errors.full_messages
    end
  end
  

  def comment_params
    params.require(:comment).permit(:body)
  end
end
