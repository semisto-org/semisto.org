require 'sidekiq/web'

Rails.application.routes.draw do
  draw :madmin

  resources :contacts, only: [:new, :create]
  resources :waitlist_subscribers, only: [:create, :show]

  # get '/agence-de-communication', to: 'hubs#agency', as: :agency
  get '/financement', to: 'pages#funding', as: :funding
  get '/a-propos', to: 'pages#about', as: :about
  get '/bureau-d-etudes', to: 'hubs#design', as: :design
  # get '/financement-de-projets', to: 'hubs#funding', as: :funding_hub
  get '/food-forest-heroes', to: 'hubs#heroes', as: :heroes
  get '/forets-comestibles', to: 'pages#food_forests', as: :food_forests
  get '/open-source', to: 'pages#open_source', as: :open_source
  # get '/pepiniere-ecole', to: 'hubs#nursery', as: :nursery
  get '/formations', to: 'hubs#trainings', as: :trainings
  get '/chasseur-de-plants', to: "hubs#plants_hunter", as: :plants_hunter

  get '/vie-privee', to: 'home#privacy', as: :privacy
  get '/conditions', to: 'home#terms', as: :terms

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'

    namespace :madmin do
      resources :impersonates do
        post :impersonate, on: :member
        post :stop_impersonating, on: :collection
      end
    end
  end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
