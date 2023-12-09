Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admin_users, skip: [:registrations, :passwords, :confirmations, :unlocks, :omniauth_callbacks, :mailers, :rememberable], controllers: {
    sessions: 'admin_users/sessions'
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
      get 'start'         # 苦手クイズの開始ページ
      post 'start_quiz'   # クイズセッションの開始
      get 'score'         # スコア表示ページ
    end
    member do
      post 'answer'       # クイズの回答処理
      get 'explanation'   # クイズの解説ページ
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
