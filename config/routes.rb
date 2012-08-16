Capykoa::Application.routes.draw do
  devise_for :admins
  root :to => "home#index"
  match '/food', :to => 'home#food'
  match '/programming', :to => 'home#programming'
  
  resources :searches, only: [:index]
  
  namespace :admin do
    resources :articles do
      resources :article_attachments, :only => [:create, :destroy]
    end
    match '/', :to => 'dashboard#index'
  end
end
