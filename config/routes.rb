# == Route Map
#
#                    Prefix Verb   URI Pattern                                    Controller#Action
#                home_index GET    /home/index(.:format)                          home#index
# create_guest_api_v1_users GET    (/:locale)/api/v1/users/create_guest(.:format) api/v1/users#create_guest {:format=>"json", :constraint=>#<ApiConstraint:0x00559779933120 @version=1>, :locale=>/en|ar/}
#              api_v1_users POST   (/:locale)/api/v1/users(.:format)              api/v1/users#create {:format=>"json", :constraint=>#<ApiConstraint:0x00559779933120 @version=1>, :locale=>/en|ar/}
#               api_v1_user GET    (/:locale)/api/v1/users/:id(.:format)          api/v1/users#show {:format=>"json", :constraint=>#<ApiConstraint:0x00559779933120 @version=1>, :locale=>/en|ar/}
#                           PATCH  (/:locale)/api/v1/users/:id(.:format)          api/v1/users#update {:format=>"json", :constraint=>#<ApiConstraint:0x00559779933120 @version=1>, :locale=>/en|ar/}
#                           PUT    (/:locale)/api/v1/users/:id(.:format)          api/v1/users#update {:format=>"json", :constraint=>#<ApiConstraint:0x00559779933120 @version=1>, :locale=>/en|ar/}
#                           DELETE (/:locale)/api/v1/users/:id(.:format)          api/v1/users#destroy {:format=>"json", :constraint=>#<ApiConstraint:0x00559779933120 @version=1>, :locale=>/en|ar/}
#           api_v1_sessions POST   (/:locale)/api/v1/sessions(.:format)           api/v1/sessions#create {:format=>"json", :constraint=>#<ApiConstraint:0x00559779933120 @version=1>, :locale=>/en|ar/}
#            api_v1_session DELETE (/:locale)/api/v1/sessions/:id(.:format)       api/v1/sessions#destroy {:format=>"json", :constraint=>#<ApiConstraint:0x00559779933120 @version=1>, :locale=>/en|ar/}
#       api_v1_users_signup POST   (/:locale)/api/v1/users/signup(.:format)       api/v1/users#create {:format=>"json", :constraint=>#<ApiConstraint:0x00559779933120 @version=1>, :locale=>/en|ar/}
#       api_v1_users_signin POST   (/:locale)/api/v1/users/signin(.:format)       api/v1/sessions#create {:format=>"json", :constraint=>#<ApiConstraint:0x00559779933120 @version=1>, :locale=>/en|ar/}
#          new_user_session GET    /users/sign_in(.:format)                       devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                       devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                      devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                  devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                 devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                      devise/passwords#update
#                           PUT    /users/password(.:format)                      devise/passwords#update
#                           POST   /users/password(.:format)                      devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                        devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                       devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                          devise/registrations#edit
#         user_registration PATCH  /users(.:format)                               devise/registrations#update
#                           PUT    /users(.:format)                               devise/registrations#update
#                           DELETE /users(.:format)                               devise/registrations#destroy
#                           POST   /users(.:format)                               devise/registrations#create
#     new_user_confirmation GET    /users/confirmation/new(.:format)              devise/confirmations#new
#         user_confirmation GET    /users/confirmation(.:format)                  devise/confirmations#show
#                           POST   /users/confirmation(.:format)                  devise/confirmations#create
# 

# require 'api_constraint'

Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'home/index'
  

  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
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
