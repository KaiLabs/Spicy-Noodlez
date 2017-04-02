Rails.application.routes.draw do
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users
  resources :calendars, :only => [:index]
  resources :posts, :only => [:index]
  resources :lostandfounds
  resources :events
  resources :rides
  resources :errors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  get '/signup',  to: 'users#new'
  get '/signin',  to: 'sessions#new'
  get '/pages/:page', to: 'pages#show'
  get "/calendar", to: "events#calendar"
  delete '/signout', to: 'sessions#destroy'
  # get '/users/:id/confirm_email', to: 'users#confirm_email'

  resources :users do
    member do
      get :confirm_email
    end
  end
  # match "/404", :to => "errors#not_found", :via => :all
  # match "/500", :to => "errors#internal_server_error", :via => :all


end
