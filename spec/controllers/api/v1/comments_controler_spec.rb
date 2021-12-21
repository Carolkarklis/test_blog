# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe CommentsController, type: :request do
      describe 'POST #create' do
        context 'when params are valid and present' do
          it 'creates a comment' do
            api_token = 'f9bfafe5-a812-417d-9d33-686cd88cf6c0'
            user = create(:user, api_token: api_token)
            article = create(:article, user: user)
  
            headers = {
              'X-User-Token' => api_token
            }
  
            comment_params = { comment: { text: 'Awesome article!' } }
  
            post v1_article_comments_path(article), headers: headers, params: comment_params
  
            parsed_body = JSON.parse(response.body)
            expect(response.code).to eq '200'
            expect(parsed_body['text']).to eq 'Awesome article!'
          end
        end
      end

      describe 'GET #index' do
        it 'returns all comments from specific article' do
          api_token = 'f9bfafe5-a812-417d-9d33-686cd88cf6c0'
          user = create(:user, api_token: api_token)
          article = create(:article, user: user)

          create(:comment, user: user, article: article)
          create(:comment, text: "Loved it!", user: user, article: article)

          headers = {
            'X-User-Token' => api_token
          }

          get v1_article_comments_path(article), headers: headers

          parsed_body = JSON.parse(response.body)

          expect(response.code).to eq '200'
          expect(parsed_body.count).to eq 2
        end
      end
    end
  end
end