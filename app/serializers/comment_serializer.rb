class CommentSerializer < ActiveModel::Serializer
  attributes :text

  attributes :user_id do |obj|
    obj.user.id
  end
end
