Rails.application.routes.draw do
  root "static_pages#index"
  get "static_pages/news"
  get "static_pages/country"
  get "static_pages/contacts"
  get "static_pages/genres"
end
