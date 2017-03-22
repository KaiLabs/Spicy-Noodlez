Rails.application.routes.draw do
  resources :users
  resources :calendars
  resources :lostandfounds
  resources :events
  resources :posts, :only => [:index]
  resources :rides
  resources :errors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  get "/calendar", to: "events#calendar"
  # get  '/help',    to: 'static_pages#help'
  # get  '/about',   to: 'static_pages#about'
  # get  '/contact', to: 'static_pages#contact'
  # get  '/signup',  to: 'users#new'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all


end
