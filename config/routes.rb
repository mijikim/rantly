Rails.application.routes.draw do

  root 'homepage#show'

  resource :dashboards, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resource :search, only: [:show, :new]
  resources :hashtags, only: [:show]
  get '/account_activiations/edit', to: 'account_activations#edit'

  resources :users do
    post 'follows' => 'user_relationships#create'
    get 'follows' => 'user_relationships#index'
    delete 'follow' => 'user_relationships#destroy'
    get 'favorites' => 'favorited_rants#index'
    post 'profile_comments' => 'comments#create'
    resources :rants do
      post 'rant_comments' => 'comments#create'
      post 'favorites' => 'favorited_rants#create'
      delete 'favorite' => 'favorited_rants#destroy'
    end
  end

  namespace :admin do
    get 'dashboard' => 'admin_dashboards#index'
    get 'rant' => 'admin_rants#index'
    get 'user' => 'admin_users#index'
  end

end
