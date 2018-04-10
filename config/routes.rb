require 'api_constraint'

Rails.application.routes.draw do

  get 'home/index'
  

  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    namespace :api, defaults: {format: 'json'} do
      namespace :v1, constraint: ApiConstraint.new(version: 1, default: true) do
        resources :users, :only => [:show, :create, :update, :destroy] do
          collection do
            get :create_guest
          end
        end
        resources :sessions, only: [:create, :destroy]
        post 'users/signup' => 'users#create'
        post 'users/signin' => 'sessions#create'
      end
    end
  end
  devise_for :users
end
