Rails.application.routes.draw do
  root 'users#new'
  get 'users/:id/achieved' => 'users#show', filter: 'achieved', as: 'achieved'
  get 'users/:id/pending' => 'users#show', filter: 'pending', as: 'pending'
  resources :users
  resources :brands
  resources :cars do 
    get '/owns' => 'cars#owns'
  end
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
