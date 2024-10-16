require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:categories) }
    it { should have_and_belong_to_many(:tags) }
    it { should have_rich_text(:have_content) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }

    it "should allow valid statuses" do
      expect {
        Post.new(status: "draft")
        Post.new(status: "publish")
      }.to_not raise_error
    end

    it "should not allow invalid statuses" do
      expect {
        Post.new(status: "archived")
      }.to raise_error(ArgumentError)
    end
  end
end
