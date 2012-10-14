Sai_di::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admins
  root :to => "home#index"
  match '/company', :to => 'home#company'
  match '/case_studies', :to => 'home#case_studies'
  match '/thinking', :to => 'home#thinking'
  match '/people', :to => 'home#people'
  match '/press', :to => 'home#press'
  match '/contact_us', :to => 'home#contact_us'
  resources :articles, only: [:show]
  resources :searches, only: [:index]
  resources :comments, only: [:create, :destroy]
  resources :newsletter_emails, only: [:create]
  resources :pages, only: [:show]
  namespace :admin do
    resources :articles do
      resources :article_attachments, :only => [:create, :destroy, :update]
      get "tags"
    end
    resources :admins
    resources :news, :only => [:create]
    resources :pages
    match '/', :to => 'dashboard#index'
  end
  
  get '/coming_soon', :to => 'coming_soon#index'
  match 'demo_sign_in', :to => 'coming_soon#log_in'
  
end
