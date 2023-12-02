Rails.application.routes.draw do
  devise_for :users, skip: [:confirmations, :unlocks, :omniauth_callbacks]

  root 'quiz_sets#index'
  resources :quiz_sets, only: [:index, :show] do
    member do
      post 'start_quiz'
      get 'score'
    end
    resources :quizzes, only: [:show] do
      member do
        post 'answer'
        get 'explanation'
      end
    end
  end

  resources :quizzes, only: [:index] do
    get 'search', on: :collection
  end

  resource :mypages, only: [] do
    collection do
      get 'profile'
      get 'scores'
      patch 'update_profile'
    end
  end

  get 'terms', to: 'pages#terms'
  get 'privacy', to: 'pages#privacy'
end
