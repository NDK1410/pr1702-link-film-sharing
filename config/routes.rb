Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root "static_pages#home"
  get "/news",    to: "static_pages#news"
  get "/contact", to: "static_pages#contact"
  get "/genres",  to: "static_pages#genres"
  post "/rate",   to: "rater#create"

  resources :posts, only: [:show] do
    resources :comments
  end
  resources :search, only: [:index]
  resources :categories, only: [:index, :show]
end
