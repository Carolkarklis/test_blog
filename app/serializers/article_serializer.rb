class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body

  attributes :user_id do |obj|
    obj.user.id
  end
end
