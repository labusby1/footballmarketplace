Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  #nested resourses for users/:user_id/portfolios/:portfolio_id/onthemarkets/...
  
  resources :users do
    resource :portfolio do
      resources :onthemarkets
    end
    resources :transactors
  end

end
