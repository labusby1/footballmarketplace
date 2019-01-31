Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resource :portfolio
  end
  resources :portfolios do
    resources :onthemarkets
  end
end
