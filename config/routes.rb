Rails.application.routes.draw do
  resources :feeds
  resources :locations
  resources :app_data
  resources :mobile_apps
  resources :agencies
  resources :domain_alexas
  resources :news
  resources :companies do 
    collection { post :import }
  end
  resources :categories
  resources :domains do 
    collection { post :import }
    collection { get :autocomplete }
  end
  resources :daycares
  resources :blogs
  resources :linkedin_counts do
    collection { post :import }
  end
  ActiveAdmin.routes(self)
  devise_for :users

  as :user do
  	get "signin" => 'devise/sessions#new'
  	delete "signout" => 'devise/sessions#destroy'
  	get "signup" => 'devise/registrations#new'
  end

  root 'pages#home'

  get 'about' => 'pages#about'
  get 'terms' => 'pages#terms'
  get 'contact' => 'pages#contact'
  get 'uploads' => 'pages#uploads'
  get 'talent' => 'pages#talent'

  get 'sitemap' => 'pages#sitemap'
  get 'for_providers' => 'pages#for_providers'
  get 'dashboard' => 'pages#dashboard'
  get 'privacy_policy' => 'pages#privacy_policy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
