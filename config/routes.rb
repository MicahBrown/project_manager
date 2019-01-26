Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/register' => 'users#new'
  post '/register' => 'users#create'

  resources :users, only: [:show]
  resources :crews, only: [:show, :new, :create, :index] do
    resources :feed, only: [:index] do
      resources :comments, only: [:create]
    end
    resources :todos, only: [:index, :new, :create, :edit, :update]
    resources :notes, only: [:index, :new, :create, :edit, :update]
    resources :conversations, only: [:index, :new, :create, :show]
    resources :comments, only: [:create]
    resources :polls, only: [:create]
    resources :attachments, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
