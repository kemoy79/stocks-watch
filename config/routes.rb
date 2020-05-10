Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users


  root 'pages#index'
  get 'portfolio', to: 'users#portfolio'
  get 'stock/search', to: 'stocks#stock_search'
  get 'friends', to: 'users#friends'
  get 'friends/search', to: 'users#friend_search'
end
