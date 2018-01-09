Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sk
  resources :users

  root 'sk#index'
  get "worldcup", to: 'sk#worldcup'
  get "signup", to: 'users#new'
end
