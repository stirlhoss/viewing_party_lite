Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing_page#index'

  get '/register', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show', as: 'dashboard'
  get '/discover', to: 'users#discover', as: 'discover'
  resources :users, only: %i[create show new] do
    resources :movies, only: %i[index show] do
      resources :parties, only: %i[create new]
    end
  end


  # get '/discover', to: 'users#discover'
  # get '/movies/:movie_id/viewing-party/new', to: 'viewing_parties#new'
end
