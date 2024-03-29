Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
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
  post 'add_card/:card_id', to: 'users#add_card', as: 'add_card'
  delete 'remove_card/:card_id', to: 'users#remove_card', as: 'remove_card'
  get 'collection', to: 'users#collection', as: 'collection'
  delete 'remove_set', to:'users#remove_set', as: 'remove_set'
  post 'add_set', to:'users#add_set', as: 'add_set'
end
