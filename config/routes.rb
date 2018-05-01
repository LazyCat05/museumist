Rails.application.routes.draw do
  root 'app#index'
  devise_for :users
  resources :genres, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :genres, only: [:index, :show]
    end
  end 

  resources :museums, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :museums, only: [:index, :show] do
        resources :reviews, only: [:index]
      end
    end
  end
end
