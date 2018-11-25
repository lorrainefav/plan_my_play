Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :player do
    resources :tournaments, only: :index
    resources :availabilities, only: [:index]
    resources :convocations, only: [] do
      member do
        post 'refuse'
        post 'accept'
      end
    end
  end

  resources :tournaments, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      post "convocations/grouped_send", to: "convocations#grouped_send"
    end
    resources :matches, only: [:index, :create]
    resources :users, only: [:index]
    resources :registrations, only: [:new, :create]
  end
  resources :registrations, only: [:edit, :update, :destroy]
  resources :matches, only: [:update, :destroy]
  resources :convocations, only: [] do
    member do
      post 'accept'
      post 'refuse'
      post 'unique_send'
    end
  end
end
