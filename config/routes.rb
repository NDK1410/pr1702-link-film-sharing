Rails.application.routes.draw do
  devise_for :users
  
  root "static_pages#index"
  get "static_pages/news"
  get "static_pages/country"
  get "static_pages/contacts"
  get "static_pages/genres"

  devise_for :users
end
