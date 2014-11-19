Rails.application.routes.draw do

  root 'homepage#show'

  resource :dashboards, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resource :search, only: [:show, :new]
  resources :hashtags, only: [:show]
  get '/account_activiations/edit', to: 'account_activations#edit'
  delete 'impersonate' => 'impersonate#destroy'
  post 'find_rant' => 'admin/rants#find_rants'

  resources :users do
    post 'follows' => 'user_relationships#create'
    get 'follows' => 'user_relationships#index'
    delete 'follow' => 'user_relationships#destroy'
    get 'favorites' => 'favorited_rants#index'
    post 'profile_comments' => 'comments#create'
    resources :impersonate, only: [:new]
    resources :rants do
      post 'rant_comments' => 'comments#create'
      post 'favorites' => 'favorited_rants#create'
      delete 'favorite' => 'favorited_rants#destroy'
    end
  end

  namespace :admin do
    get 'dashboard' => 'admin_dashboards#index'
    resources :rants, only: [:index, :update, :show, :destroy]
    resources :users, only: [:index, :update]

  end

end
