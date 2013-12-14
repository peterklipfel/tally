Tally::Application.routes.draw do
  resources :payments
  resources :clients
  resources :invoices do
    resources :expenses
    get :preview, on: :member
  end
  devise_for :users
  root 'pages#index'
end
