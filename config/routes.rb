Rails.application.routes.draw do
  devise_for :admin
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  root to: 'public/homes#top'

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :shops
    resources :posts, only: [:index, :show, :update, :destroy]
    resources :reviews, only: [:index, :show, :update, :destroy]
  end

  scope module: :public do
    resources :users, only: [:show, :edit, :update] do
      collection do
        get :unsubscribe
        patch :withdraw
      end
    end
    resources :shops, only: [:index, :show] do
      resources :reviews
    end
    resources :posts
  end
end
