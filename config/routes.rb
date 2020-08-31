Rails.application.routes.draw do
  devise_for :users
  root to: 'offers#home'
  resources :offers do
    resources :inquiries
    resources :reviews
    end
    resources :users, only: [ :show ]
end
