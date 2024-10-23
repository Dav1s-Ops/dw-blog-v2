class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags

  has_rich_text :content

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  enum status: { draft: "draft", publish: "publish" }
end
