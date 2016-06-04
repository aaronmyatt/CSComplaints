Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", :registrations => 'registrations' }

  resources :users
  resources :complaints
  resources :payments

  get "locations/search", controller: "locations", action: "search", as: :location_search

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  post '/upvote' => 'upvote#upvote', as: :upvote

  post '/downvote' => 'upvote#downvote', as: :downvote
  # You can have the root of your site routed with "root"
  root 'complaints#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  post '/payments/send' => 'payments#send', as: :payments_send
  post '/payments/success' => 'payments#success', as: :payments_success

  # You can have the root of your site routed with "root"
  root 'complaints#index'
end
