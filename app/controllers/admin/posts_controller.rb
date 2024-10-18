class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def show
  end

  def new
  end

  def edit
  end
end
