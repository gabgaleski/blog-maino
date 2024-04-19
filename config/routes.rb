Rails.application.routes.draw do
  root 'main#index'

  resources :posts do 
    resources :comments
  end
  
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]

  get '/', to: 'posts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

end
