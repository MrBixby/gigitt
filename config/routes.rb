Rails.application.routes.draw do
  get 'timeslots/index'
  get 'timeslots/show'
  get 'timeslots/new'
  get 'timeslots/create'
  get 'timeslots/edit'
  get 'timeslots/update'
  get 'timeslots/destroy'
  get 'profiles/user'

  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
    get 'edit', to: 'devise/registrations#edit', as: :edit
    get 'gigitt', to: 'gigs#new', as: :gigitt
  end

  resources :gigs
  root to: 'gigs#index'

  get '/:id', to: 'profiles#user'

end
