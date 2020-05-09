Rails.application.routes.draw do
  devise_for :users


  root 'pages#index'
  get 'portfolio', to: 'users#portfolio'
  get 'stock/search', to: 'stocks#stock_search'
end
