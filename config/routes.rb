Rails.application.routes.draw do
  # scope :api, defaults: { format: :json } do
  #   devise_for :users
  # end

  scope module: 'api' do
    devise_for :users

    namespace :v1 do
      resources :articles, only: [:index, :create, :show] do
        resources :comments, only: [:create, :index]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
