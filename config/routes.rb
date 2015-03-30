Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  devise_scope :user do
    get  'sitters/sign_up' => 'devise/registrations#new_sitter', :as => 'new_sitter_registration'
    post 'sitters/sign_up' => 'devise/registrations#create', :as => 'sitter_registration'
  end

  resources :owners
  resources :dogs
  resources :sitters


end
