Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offers do
    resources :inquiries, shallow: true
    resources :reviews
    end
    resources :users, only: [ :show ]
    resources :contact, only: [:new, :create]
    get 'contact_us' => 'pages#contact_us'
end
