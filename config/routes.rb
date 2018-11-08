Rails.application.routes.draw do
  get 'chat_messages/index'
  root 'home#top'
  get 'home/about'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'contacts/index'
  post 'contacts/confirm'
  post 'contacts/thanks'


  resources :posts, only: [:new, :create, :destroy, :index, :show]

  resources :posts do
    resources :comments, only: [:index, :create, :destroy]
  end


  resources :users

end
