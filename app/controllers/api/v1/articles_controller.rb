# frozen_string_literal: true

module Api::V1
  class ArticlesController < ApiController
    before_action :set_user
    before_action :set_article, only: :show

    def index
      @articles = Article.all

      render json: @articles, each_serializer: ArticleSerializer
    end

    def show
      render json: ArticleSerializer.new(@article).as_json
    end

    def create
      @article = Article.new(article_params.merge(user_id: @user.id))

      if @article.save
        render json: ArticleSerializer.new(@article).as_json
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end

    private

    def article_params
      params.require(:article).permit(
        :title,
        :body
      )
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def set_user
      @user = warden.user
    end
  end
end