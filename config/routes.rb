Rails.application.routes.draw do
  root 'users#new'
  get 'users/:id/owned' => 'users#show', filter: 'owned', as: 'owned'
  get 'users/:id/fly' => 'users#show', filter: 'fly', as: 'fly'
  resources :users
  resources :brands
  resources :cars do 
    get '/owns' => 'cars#owns'
  end
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
