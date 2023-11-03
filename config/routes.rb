Rails.application.routes.draw do
  devise_for :users
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
  devise_for :users, skip: %i[registrations sessions passwords]
  devise_scope :user do
    post '/signup', to: 'registrations#create'
    post '/login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end
end
