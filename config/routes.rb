Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :new, :create, :destroy]
  resources :payments, only: [:create]
  root 'static_pages#landing_page'
  get 'static_pages/index'
  get 'static_pages/about'
  get 'static_pages/contact'
  post 'static_pages/danke'
end
