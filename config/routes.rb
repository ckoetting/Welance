Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/profile_sign_up', to: 'users/registrations#profile_sign_up', :via => [:get], :as => 'profile_sign_up'
  end
  root to: 'pages#home'
  post '/bookmark/:id' => 'offers#bookmark', as: :bookmark
  resources :offers do
    resources :inquiries do
      member do
        get 'create_chat', to: 'chatrooms#create_chatroom'
      end
      resources :interviews, only: [:new, :create]
    end
    resources :reviews
  end
  get '/users/my_interviews', to: 'interviews#my_interviews', as: :my_interviews
  get '/users/my_inquiries', to: 'inquiries#index', as: :my_inquiries
  get 'users/applications', to: 'users#job_offers', as: :business_applications
  get 'users/success', to: 'users#success', as: :inquiry_sent
  get 'users/savedoffers', to: 'users#saved_offers', as: :saved_offers
  get 'users/applications/:id/change_status', to: 'inquiries#change_status', as: :change_status
  resources :users
  resources :contact, only: [:new, :create]
  # resources :about, only: [:show]
  get 'contact_us' => 'pages#contact_us'
  resources :services, only: [:show]
  get 'services' => 'pages#services'
  get 'about' => 'pages#about', as: :about
  resources :customers, only: [:show]
  get 'customers' => 'pages#customers'
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
