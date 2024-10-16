class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @total_posts = Post.count
    @total_topics = Category.count
    @total_tags = Tag.count
    @draft_posts = Post.where(status: 'Draft').count
    @posts_by_category = Category.joins(:posts).group('categories.name').count
  end
end
