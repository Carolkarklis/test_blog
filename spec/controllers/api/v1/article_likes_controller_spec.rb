# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe ArticleLikesController, type: :request do
      describe 'POST #create' do
        it 'creates a like for a specific article' do
          api_token = 'f9bfafe5-a812-417d-9d33-686cd88cf6c0'
          user = create(:user, api_token: api_token)
          article = create(:article, user: user)

          headers = {
            'X-User-Token' => api_token
          }
          
          expect(article.article_likes.count).to eq 0

          post v1_article_article_likes_path(article), headers: headers

          parsed_body = JSON.parse(response.body)
          expect(response.code).to eq '200'
          expect(article.article_likes.count).to eq 1
        end
      end
    end
  end
end