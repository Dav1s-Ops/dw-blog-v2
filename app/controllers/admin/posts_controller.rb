class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.order(:created_at)
  end

  def show
  end

  def new
  end

  def edit
  end
end
