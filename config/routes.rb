Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  
  # get "articles/new", to: "articles#new", as: :new_article
  # get "articles/:id", to: "articles#show", as: :article
  # patch "articles/:id", to: "articles#update"
  # delete "articles/:id", to: "articles#destroy"
  # get "articles/:id/edit", to: "articles#edit", as: :edit_article
  # post "articles", to: "articles#create", as: :articles

  resources :articles
end
