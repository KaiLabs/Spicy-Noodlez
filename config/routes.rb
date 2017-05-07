Rails.application.routes.draw do
  resources :emails, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :calendars, :only => [:index]
  resources :posts, :only => [:index]
  # resources :lostandfounds
  # resources :trading_posts
  # resources :rides
  # resources :events
  # resources :users

  resources :users do
    member do
      put "add_admin", to: "users#add_admin"
      put "remove_admin", to: "users#remove_admin"
    end
  end

  resources :events do
    member do
      put "like", to: "events#upvote"
      put "dislike", to: "events#downvote"
      post "favorite", to: "events#favorite"
      post "unfavorite", to: "events#unfavorite"
    end
  end

  resources :lostandfounds do
    member do
      put "like", to: "lostandfounds#upvote"
      put "dislike", to: "lostandfounds#downvote"
      post "favorite", to: "lostandfounds#favorite"
      post "unfavorite", to: "lostandfounds#unfavorite"
    end
  end

  resources :rides do
    member do
      put "like", to: "rides#upvote"
      put "dislike", to: "rides#downvote"
      post "favorite", to: "rides#favorite"
      post "unfavorite", to: "rides#unfavorite"
    end
  end
  
  resources :trading_posts do
    member do
      put "like", to: "trading_posts#upvote"
      put "dislike", to: "trading_posts#downvote"
      post "favorite", to: "trading_posts#favorite"
      post "unfavorite", to: "trading_posts#unfavorite"
    end
  end


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
