class Admin::PostsController < Admin::ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  def index
    @pagy, @posts = pagy(Post.order(created_at: :desc), limit: 10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to admin_posts_path, notice: 'Post created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: 'Post updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: 'Post deleted.'
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def edit
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :status, category_ids: [], tag_ids: [])
  end
end
