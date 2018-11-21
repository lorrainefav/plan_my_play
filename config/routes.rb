Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :player do
    resources :tournaments, only: :index
    resources :availabilities, only: [:index]
    resources :convocations, only: [:update]
  end

  resources :tournaments, only: [:index, :show] do
    resources :matches, only: [:index, :create]
    resources :users, only: [:index]
  end
  resources :matches, only: [:update, :destroy]
  resources :convocations, only: [:update]
end
