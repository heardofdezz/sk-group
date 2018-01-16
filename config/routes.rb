Rails.application.routes.draw do
<<<<<<< HEAD



=======
  get 'tournament/bracket'
>>>>>>> 26c5e07f84b5e7923f186283aef4b5205a76cfbd

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :sk
  resources :users
  resources :sessions

  root 'sk#index'
  get 'worldcup', to: 'sk#worldcup'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
