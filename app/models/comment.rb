class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :comment_likes, dependent: :destroy

  def likes_count
    comment_likes.count
  end
end
