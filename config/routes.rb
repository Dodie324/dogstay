Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :dogs
  resources :sitters do
    resources :reviews
    resources :messages
    resources :images
  end
end
