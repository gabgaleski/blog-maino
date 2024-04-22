Rails.application.routes.draw do
  root 'main#index'

  resources :posts do 
    resources :comments
  end
  
  get '/users', to: 'users#new'
  post '/users', to: 'users#create'

  get '/profile', to: 'profiles#edit'
  patch '/profile', to: 'profiles#update'

  get '/', to: 'posts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  delete'/logout', to: 'sessions#destroy'

  get '/password/reset/edit', to: 'password_resets#edit'
  post '/password/reset/edit', to: 'password_resets#update'

  get '/password/reset', to: 'password_resets#new'
  post '/password/reset', to: 'password_resets#create'


end
