Tally::Application.routes.draw do
  resources :clients

  resources :expenses

  resources :invoices

  devise_for :users

  root 'pages#index'

end
