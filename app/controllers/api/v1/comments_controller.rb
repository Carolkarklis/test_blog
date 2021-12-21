# frozen_string_literal: true

module Api::V1
  class CommentsController < ApiController
    before_action :set_user, :set_article

    def index
      render json: @article.comments, each_serializer: CommentSerializer
    end

    def create
      @comment = Comment.new(comment_params.merge(user_id: @user.id, article_id: @article.id))

      if @comment.save
        render json: CommentSerializer.new(@comment).as_json
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end

    private

    def comment_params
      params.require(:comment).permit(
        :text
      )
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_user
      @user = warden.user
    end
  end
end