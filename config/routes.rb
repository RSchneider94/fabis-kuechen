Rails.application.routes.draw do
  resources :products
  root 'static_pages#index'
  get 'static_pages/about'
  get 'static_pages/contact'
end
