Rails.application.routes.draw do
  devise_for :admin
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  root to: 'public/homes#top'

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :shops
    resources :posts, only: [:index, :show, :destroy]
    resources :reviews, only: [:index, :show, :destroy]
  end

  scope module: :public do
    resources :users, only: [:show, :edit, :update, :destroy] do
      collection do
        get :unsubscribe
      end
    end
    resources :shops, only: [:index, :show] do
      resources :reviews do
        resources :comments, only: [:create, :destroy]
      end
    end
    resources :posts
    resources :tags do
      get 'posts', to: 'posts#index'
    end
  end
end
