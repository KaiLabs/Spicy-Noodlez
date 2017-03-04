Rails.application.routes.draw do
  resources :calendars
  resources :lostandfounds
  resources :events
  resources :rides
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"

  get "/calendar", to: "events#calendar"
  
end
