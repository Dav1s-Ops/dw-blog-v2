class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags

  has_rich_text :have_content

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :content, presence: true

  enum status: { draft: "draft", publish: "publish" }
end
