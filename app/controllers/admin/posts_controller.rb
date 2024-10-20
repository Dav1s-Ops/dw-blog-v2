class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @pagy, @posts = pagy(Post.order(created_at: :desc), limit: 10)
  end

  def show
  end

  def new
  end

  def edit
  end
end
