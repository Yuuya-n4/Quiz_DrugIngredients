Rails.application.routes.draw do
  devise_for :users, skip: [:confirmations, :unlocks, :omniauth_callbacks]
  root 'quiz_sets#index'
  resources :quiz_sets, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
