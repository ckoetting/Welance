Rails.application.routes.draw do
devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :offers do
    resources :inquiries, shallow: true
    resources :reviews
    end
  get '/users/my_inquiries', to: 'inquiries#index', as: :my_inquiries
  get 'users/applications', to: 'users#job_applications', as: :business_applications
  resources :users, only: [ :show ] 
  resources :contact, only: [:new, :create]
  get 'contact_us' => 'pages#contact_us'
end
