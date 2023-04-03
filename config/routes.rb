Rails.application.routes.draw do
  resources :card_conditions
  resources :auction_items
  resources :cards
  resources :serie_sets
  resources :series
  resources :card_types
  resources :card_rarities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
