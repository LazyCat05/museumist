Rails.application.routes.draw do
  # root 'homes#index'
  root "static_pages#index"
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :museums, only: [:index]
      resources :museums, only: [:index, :show]
    end
  end
end
