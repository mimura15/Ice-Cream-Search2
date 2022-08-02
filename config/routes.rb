Rails.application.routes.draw do
  devise_for :admin
  devise_for :users, controllers: {
    registrations: 'public/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  root to: 'public/homes#top'
end
