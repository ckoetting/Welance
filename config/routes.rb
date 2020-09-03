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
  resources :users, only: [ :show ] 
  resources :contact, only: [:new, :create]
  get 'contact_us' => 'pages#contact_us'
end
