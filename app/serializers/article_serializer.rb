class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :comments_count, :likes_count

  attributes :user_id do |obj|
    obj.user.id
  end
end
