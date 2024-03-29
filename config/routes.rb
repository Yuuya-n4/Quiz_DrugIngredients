Rails.application.routes.draw do
  get 'feedbacks/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admin_users, skip: [:registrations, :passwords, :confirmations, :unlocks, :omniauth_callbacks, :mailers, :rememberable], controllers: {
    sessions: 'admin_users/sessions',
  }

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

  resources :weak_quizzes, only: [:show] do
    collection do
      get 'start'
      post 'start_quiz'
      get 'score'
    end
    member do
      post 'answer'
      get 'explanation'
    end
  end

  resources :quizzes, only: [:index] do
    collection do
      get 'search'
    end
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

  namespace :api do
    resources :ratings, only: [:create]
    get 'ratings', to: 'ratings#show'
    resources :quiz_sets, only: [:index]
  end

  resources :feedbacks, only: [:create]
end
