Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :sitters, only: [:index, :show, :destroy] do
    resources :reviews, only: [:edit, :create, :update, :destroy]
    resources :messages, only: [:new, :create]
    resources :images, only: [:create]
  end
end
