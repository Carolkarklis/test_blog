# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe ArticlesController, type: :request do
      describe 'POST #create' do
        context 'when params are valid and present' do
          it 'creates an article' do
            api_token = 'f9bfafe5-a812-417d-9d33-686cd88cf6c0'
            user = create(:user, api_token: api_token)
  
            headers = {
              'X-User-Token' => api_token
            }
  
            article_params = { article: { title: 'Article title', body: 'Description here' } }
  
            post v1_articles_path, headers: headers, params: article_params
  
            parsed_body = JSON.parse(response.body)
            expect(response.code).to eq '200'
            expect(parsed_body['title']).to eq 'Article title'
            expect(parsed_body['user_id']).to eq user.id
          end
        end

        context 'when params are missing' do
          it 'returns unprocessable entity' do
            api_token = 'f9bfafe5-a812-417d-9d33-686cd88cf6c0'
            user = create(:user, api_token: api_token)
  
            headers = {
              'X-User-Token' => api_token
            }
  
            article_params = { article: { body: 'Description here' } }
  
            post v1_articles_path, headers: headers, params: article_params
  
            parsed_body = JSON.parse(response.body)
  
            expect(response.code).to eq '422'
            expect(parsed_body).to eq({ "title" => ["can't be blank"]})
          end
        end
      end

      describe 'GET #index' do
        it 'returns all articles' do
          api_token = 'f9bfafe5-a812-417d-9d33-686cd88cf6c0'
          user = create(:user, api_token: api_token)

          headers = {
            'X-User-Token' => api_token
          }

          create(:article, title: "Article A", user: user)
          create(:article, title: "Article B", user: user)

          get v1_articles_path, headers: headers

          parsed_body = JSON.parse(response.body)

          expect(response.code).to eq '200'
          expect(parsed_body.first["title"]).to eq "Article A"
          expect(parsed_body.last["title"]).to eq "Article B"
        end
      end

      describe 'GET #show' do
        it 'returns specific article' do
          api_token = 'f9bfafe5-a812-417d-9d33-686cd88cf6c0'
          user = create(:user, api_token: api_token)

          headers = {
            'X-User-Token' => api_token
          }

          article = create(:article, title: "Article A", user: user)

          get v1_articles_path(article), headers: headers
          parsed_body = JSON.parse(response.body)

          expect(response.code).to eq '200'
          expect(parsed_body.first['title']).to eq 'Article A'
        end
      end
    end
  end
end
