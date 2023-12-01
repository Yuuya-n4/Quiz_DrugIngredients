Rails.application.routes.draw do
  get 'quizzes/show'
  devise_for :users, skip: [:confirmations, :unlocks, :omniauth_callbacks]
  root 'quiz_sets#index'
  
  resources :quiz_sets, only: [:index, :show] do
    resources :quizzes, only: [:show] do
      member do
        post 'answer'
        get 'explanation'
      end
    end
    get 'score', on: :member
  end

  resources :quizzes, only: [:index] do
    get 'search', on: :collection
  end
end
