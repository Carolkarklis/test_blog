class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :article_likes

  validates :title, presence: true
  validates :body, presence: true

  def comments_count
    comments.count
  end

  def likes_count
    article_likes.count
  end
end
