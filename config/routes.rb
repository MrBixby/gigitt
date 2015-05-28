Rails.application.routes.draw do

  get 'info/home'

  get 'info_controller/home'

  get 'dashboard', to: 'dashboard#dashboard', as: :dashboard

  patch 'finalize', to: 'timeslots#finalize', as: :finalize

  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
    get 'edit', to: 'devise/registrations#edit', as: :edit
    get 'gigitt', to: 'gigs#new', as: :gigitt
  end

  resources :profiles, only: [:new, :show, :edit, :update, :create, :destroy]
  resources :venues do
  resources :timeslots
  end

  resources :bands
  resources :fans

  resources :gigs
  root to: 'info#home'

  resources :venues do
    post 'follow',   to: 'venues#follow'
    post 'unfollow', to: 'venues#unfollow'
  end

  resources :bands do
    post 'follow',   to: 'bands#follow'
    post 'unfollow', to: 'bands#unfollow'
  end

end
