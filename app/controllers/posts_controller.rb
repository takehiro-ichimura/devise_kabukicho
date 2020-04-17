class PostsController < ApplicationController
  before_action :authenticate_user!, {only: [:new, :create, :show, :edit, :update, :destroy]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "この操作をする権限がありません"
      redirect_to("/posts/index")
    end
  end
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(
      content: params[:content],
      user_id: current_user.id
    )
    if @post.save
      flash[:notice] = "投稿成功"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  def show
    @post = Post.find_by(id: params[:id])
    @comments = Comment.where(post_id: params[:id])
  end
  def edit
    @post = Post.find_by(id: params[:id])
  end
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "スレッド更新成功"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end
  def comment
    @comment = Comment.new(
      content: params[:content],
      user_id: current_user.id,
      post_id: params[:id]
    )
    if @comment.save
      flash[:notice] = "コメント成功"
      redirect_to("/posts/#{params[:id]}")
    else
      flash[:notice] = "コメントできませんでした"
      redirect_to("/posts/#{params[:id]}")
    end
  end
end
