Capykoa::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admins
  root :to => "home#index"
  match '/food', :to => 'home#food'
  match '/programming', :to => 'home#programming'
  match '/about', :to => 'home#about'
  resources :articles, only: [:show]
  resources :searches, only: [:index]
  resources :comments, only: [:create, :destroy]
  namespace :admin do
    resources :articles do
      resources :article_attachments, :only => [:create, :destroy, :update]
      get "tags"
    end
    resources :admins
    match '/', :to => 'dashboard#index'
  end
  mount NewsFeedSampleApp::Engine, :at => "/news_feed"
  
end
