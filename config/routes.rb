Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offers do
    resources :inquiries
    resources :reviews
    end
    resources :users, only: [ :show ]
end
