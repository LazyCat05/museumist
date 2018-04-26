Rails.application.routes.draw do
  # root 'homes#index'
  root "app#index"
  devise_for :users
  resources :museums, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :museums, only: [:index, :show]
    end
  end
end
