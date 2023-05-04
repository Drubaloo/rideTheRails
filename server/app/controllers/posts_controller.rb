require 'uuidtools'
class PostsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]

  
  def index
    @posts = Post.all
    render json: @posts.as_json
  end
  
  def show
    @post = Post.includes(:comments).find(params[:id])
    render json: @post.as_json(include: :comments)
  end

  def new
    @post = Post.new
  end

  def create
    puts session.to_hash
    @post = User.find_by(id: session[:user_id]).posts.new(post_params)
    if @post.save
      render plain: "created"
    else
      render plain: "new"
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to root_path
  end


  def pokemon 

    category = params[:category]

    case category

    when "pokemon"
    @post = Post.where(pokemons_id: params[:id])

    when "users"
      @post = Post.where(user_id: params[:id])
    end
    render json: @post.as_json
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :pokemons_id)
  end
end
