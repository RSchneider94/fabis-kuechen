Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :new, :create, :destroy]
  root 'static_pages#landing_page'
  get 'static_pages/about'
  get 'static_pages/contact'
end
