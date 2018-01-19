Rails.application.routes.draw do

  get 'tournament/bracket'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :sk
  resources :users
  resources :sessions

  root 'sk#index'
  get 'bracket', to: 'sk#bracket'
  get 'worldcup', to: 'sk#worldcup'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
