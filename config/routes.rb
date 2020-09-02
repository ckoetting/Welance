Rails.application.routes.draw do
devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :offers do
    resources :inquiries, shallow: true
    resources :reviews
    end
    resources :users, only: [ :show ] do
      get 'inquiries', to: 'inquiries#index'
    end
    resources :contact, only: [:new, :create]
    get 'contact_us' => 'pages#contact_us'
end
