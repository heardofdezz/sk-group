Rails.application.routes.draw do
  get 'tournament/bracket'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sk

  root 'sk#index'
  get "worldcup", to: 'sk#worldcup'
  get "signup", to: 'sk#signup'
end
