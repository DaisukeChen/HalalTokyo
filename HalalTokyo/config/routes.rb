Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  resources :restaurants, only: [:show, :new, :create] do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  root 'restaurants#index'

end