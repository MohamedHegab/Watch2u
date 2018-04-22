

Rails.application.routes.draw do

    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    root to: "admin/dashboard#index"

  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
        get 'users/signout' => 'sessions#destroy'
        resources :users, :only => [:show, :create, :update, :destroy] do
          collection do
            get :create_guest
          end
        end
        resources :sessions, only: [:create, :destroy]
        resources :categories do
          resources :sub_categories do 
            resources :products
          end
        end
        resources :regions, only: [:index]
        post 'users/signup' => 'users#create'
        post 'users/signin' => 'sessions#create'
        post 'password/forgot', to: 'password#forgot'
        post 'password/reset', to: 'password#reset'
      end
    end
  end
  devise_for :users
end
