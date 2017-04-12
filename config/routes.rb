Rails.application.routes.draw do
  resources :emails
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users, :only => [:index, :show, :destroy]
  resources :calendars, :only => [:index]
  resources :posts, :only => [:index]
  resources :lostandfounds
  resources :events
  resources :rides
  resources :errors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  get '/pages/:page', to: 'pages#show'
  get "/calendar", to: "events#calendar"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get '/signout', to: 'sessions#destroy', as: 'signout'
  # match "/404", :to => "errors#not_found", :via => :all
  # match "/500", :to => "errors#internal_server_error", :via => :all


end
