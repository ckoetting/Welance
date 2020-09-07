Rails.application.routes.draw do
devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  root to: 'pages#home'
  post '/bookmark/:id' => 'offers#bookmark', as: :bookmark
  resources :offers do
    resources :inquiries, shallow: true
    resources :reviews
    end
  get '/users/my_inquiries', to: 'inquiries#index', as: :my_inquiries
  get 'users/applications', to: 'users#job_offers', as: :business_applications
  get 'users/success', to: 'users#success', as: :inquiry_sent
  get 'users/savedoffers', to: 'users#saved_offers', as: :saved_offers
  resources :users, only: [ :show ]
  resources :contact, only: [:new, :create]
  resources :about, only: [:show]
  get 'contact_us' => 'pages#contact_us'
  get 'about' => 'pages#about'
  resources :services, only: [:show]
  get 'services' => 'pages#services'
  get 'services' => 'pages#services'
end
