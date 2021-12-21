# frozen_string_literal: true

module Api::V1
  class ArticleLikesController < ApiController
    before_action :set_user, :set_article

    def create
      @like = ArticleLike.new(user_id: @user.id, article_id: @article.id)

      if @like.save
        render json: ArticleSerializer.new(@article).as_json
      else
        render json: @like.errors, status: :unprocessable_entity
      end
    end

    private

    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_user
      @user = warden.user
    end
  end
end