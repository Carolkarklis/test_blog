class CommentSerializer < ActiveModel::Serializer
  attributes :text, :likes_count

  attributes :user_id do |obj|
    obj.user.id
  end
end
