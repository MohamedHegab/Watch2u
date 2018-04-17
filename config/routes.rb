# == Route Map
#
#                           Prefix Verb       URI Pattern                                                              Controller#Action
#           new_admin_user_session GET        /admin/login(.:format)                                                   active_admin/devise/sessions#new
#               admin_user_session POST       /admin/login(.:format)                                                   active_admin/devise/sessions#create
#       destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                                  active_admin/devise/sessions#destroy
#          new_admin_user_password GET        /admin/password/new(.:format)                                            active_admin/devise/passwords#new
#         edit_admin_user_password GET        /admin/password/edit(.:format)                                           active_admin/devise/passwords#edit
#              admin_user_password PATCH      /admin/password(.:format)                                                active_admin/devise/passwords#update
#                                  PUT        /admin/password(.:format)                                                active_admin/devise/passwords#update
#                                  POST       /admin/password(.:format)                                                active_admin/devise/passwords#create
#                       admin_root GET        /admin(.:format)                                                         admin/dashboard#index
#   batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                                admin/admin_users#batch_action
#                admin_admin_users GET        /admin/admin_users(.:format)                                             admin/admin_users#index
#                                  POST       /admin/admin_users(.:format)                                             admin/admin_users#create
#             new_admin_admin_user GET        /admin/admin_users/new(.:format)                                         admin/admin_users#new
#            edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                                    admin/admin_users#edit
#                 admin_admin_user GET        /admin/admin_users/:id(.:format)                                         admin/admin_users#show
#                                  PATCH      /admin/admin_users/:id(.:format)                                         admin/admin_users#update
#                                  PUT        /admin/admin_users/:id(.:format)                                         admin/admin_users#update
#                                  DELETE     /admin/admin_users/:id(.:format)                                         admin/admin_users#destroy
#                  admin_dashboard GET        /admin/dashboard(.:format)                                               admin/dashboard#index
#                   admin_comments GET        /admin/comments(.:format)                                                admin/comments#index
#                                  POST       /admin/comments(.:format)                                                admin/comments#create
#                    admin_comment GET        /admin/comments/:id(.:format)                                            admin/comments#show
#                                  DELETE     /admin/comments/:id(.:format)                                            admin/comments#destroy
#             api_v1_users_signout GET        (/:locale)/api/v1/users/signout(.:format)                                api/v1/sessions#destroy {:format=>"json", :locale=>/en|ar/}
#        create_guest_api_v1_users GET        (/:locale)/api/v1/users/create_guest(.:format)                           api/v1/users#create_guest {:format=>"json", :locale=>/en|ar/}
#                     api_v1_users POST       (/:locale)/api/v1/users(.:format)                                        api/v1/users#create {:format=>"json", :locale=>/en|ar/}
#                      api_v1_user GET        (/:locale)/api/v1/users/:id(.:format)                                    api/v1/users#show {:format=>"json", :locale=>/en|ar/}
#                                  PATCH      (/:locale)/api/v1/users/:id(.:format)                                    api/v1/users#update {:format=>"json", :locale=>/en|ar/}
#                                  PUT        (/:locale)/api/v1/users/:id(.:format)                                    api/v1/users#update {:format=>"json", :locale=>/en|ar/}
#                                  DELETE     (/:locale)/api/v1/users/:id(.:format)                                    api/v1/users#destroy {:format=>"json", :locale=>/en|ar/}
#                  api_v1_sessions POST       (/:locale)/api/v1/sessions(.:format)                                     api/v1/sessions#create {:format=>"json", :locale=>/en|ar/}
#                   api_v1_session DELETE     (/:locale)/api/v1/sessions/:id(.:format)                                 api/v1/sessions#destroy {:format=>"json", :locale=>/en|ar/}
#     api_v1_sub_category_products GET        (/:locale)/api/v1/sub_categories/:sub_category_id/products(.:format)     api/v1/products#index {:format=>"json", :locale=>/en|ar/}
#                                  POST       (/:locale)/api/v1/sub_categories/:sub_category_id/products(.:format)     api/v1/products#create {:format=>"json", :locale=>/en|ar/}
#  new_api_v1_sub_category_product GET        (/:locale)/api/v1/sub_categories/:sub_category_id/products/new(.:format) api/v1/products#new {:format=>"json", :locale=>/en|ar/}
#              edit_api_v1_product GET        (/:locale)/api/v1/products/:id/edit(.:format)                            api/v1/products#edit {:format=>"json", :locale=>/en|ar/}
#                   api_v1_product GET        (/:locale)/api/v1/products/:id(.:format)                                 api/v1/products#show {:format=>"json", :locale=>/en|ar/}
#                                  PATCH      (/:locale)/api/v1/products/:id(.:format)                                 api/v1/products#update {:format=>"json", :locale=>/en|ar/}
#                                  PUT        (/:locale)/api/v1/products/:id(.:format)                                 api/v1/products#update {:format=>"json", :locale=>/en|ar/}
#                                  DELETE     (/:locale)/api/v1/products/:id(.:format)                                 api/v1/products#destroy {:format=>"json", :locale=>/en|ar/}
#   api_v1_category_sub_categories GET        (/:locale)/api/v1/categories/:category_id/sub_categories(.:format)       api/v1/sub_categories#index {:format=>"json", :locale=>/en|ar/}
#                                  POST       (/:locale)/api/v1/categories/:category_id/sub_categories(.:format)       api/v1/sub_categories#create {:format=>"json", :locale=>/en|ar/}
# new_api_v1_category_sub_category GET        (/:locale)/api/v1/categories/:category_id/sub_categories/new(.:format)   api/v1/sub_categories#new {:format=>"json", :locale=>/en|ar/}
#         edit_api_v1_sub_category GET        (/:locale)/api/v1/sub_categories/:id/edit(.:format)                      api/v1/sub_categories#edit {:format=>"json", :locale=>/en|ar/}
#              api_v1_sub_category GET        (/:locale)/api/v1/sub_categories/:id(.:format)                           api/v1/sub_categories#show {:format=>"json", :locale=>/en|ar/}
#                                  PATCH      (/:locale)/api/v1/sub_categories/:id(.:format)                           api/v1/sub_categories#update {:format=>"json", :locale=>/en|ar/}
#                                  PUT        (/:locale)/api/v1/sub_categories/:id(.:format)                           api/v1/sub_categories#update {:format=>"json", :locale=>/en|ar/}
#                                  DELETE     (/:locale)/api/v1/sub_categories/:id(.:format)                           api/v1/sub_categories#destroy {:format=>"json", :locale=>/en|ar/}
#                api_v1_categories GET        (/:locale)/api/v1/categories(.:format)                                   api/v1/categories#index {:format=>"json", :locale=>/en|ar/}
#                                  POST       (/:locale)/api/v1/categories(.:format)                                   api/v1/categories#create {:format=>"json", :locale=>/en|ar/}
#              new_api_v1_category GET        (/:locale)/api/v1/categories/new(.:format)                               api/v1/categories#new {:format=>"json", :locale=>/en|ar/}
#             edit_api_v1_category GET        (/:locale)/api/v1/categories/:id/edit(.:format)                          api/v1/categories#edit {:format=>"json", :locale=>/en|ar/}
#                  api_v1_category GET        (/:locale)/api/v1/categories/:id(.:format)                               api/v1/categories#show {:format=>"json", :locale=>/en|ar/}
#                                  PATCH      (/:locale)/api/v1/categories/:id(.:format)                               api/v1/categories#update {:format=>"json", :locale=>/en|ar/}
#                                  PUT        (/:locale)/api/v1/categories/:id(.:format)                               api/v1/categories#update {:format=>"json", :locale=>/en|ar/}
#                                  DELETE     (/:locale)/api/v1/categories/:id(.:format)                               api/v1/categories#destroy {:format=>"json", :locale=>/en|ar/}
#              api_v1_users_signup POST       (/:locale)/api/v1/users/signup(.:format)                                 api/v1/users#create {:format=>"json", :locale=>/en|ar/}
#              api_v1_users_signin POST       (/:locale)/api/v1/users/signin(.:format)                                 api/v1/sessions#create {:format=>"json", :locale=>/en|ar/}
#           api_v1_password_forgot POST       (/:locale)/api/v1/password/forgot(.:format)                              api/v1/password#forgot {:format=>"json", :locale=>/en|ar/}
#            api_v1_password_reset POST       (/:locale)/api/v1/password/reset(.:format)                               api/v1/password#reset {:format=>"json", :locale=>/en|ar/}
#                 new_user_session GET        /users/sign_in(.:format)                                                 devise/sessions#new
#                     user_session POST       /users/sign_in(.:format)                                                 devise/sessions#create
#             destroy_user_session DELETE     /users/sign_out(.:format)                                                devise/sessions#destroy
#                new_user_password GET        /users/password/new(.:format)                                            devise/passwords#new
#               edit_user_password GET        /users/password/edit(.:format)                                           devise/passwords#edit
#                    user_password PATCH      /users/password(.:format)                                                devise/passwords#update
#                                  PUT        /users/password(.:format)                                                devise/passwords#update
#                                  POST       /users/password(.:format)                                                devise/passwords#create
#         cancel_user_registration GET        /users/cancel(.:format)                                                  devise/registrations#cancel
#            new_user_registration GET        /users/sign_up(.:format)                                                 devise/registrations#new
#           edit_user_registration GET        /users/edit(.:format)                                                    devise/registrations#edit
#                user_registration PATCH      /users(.:format)                                                         devise/registrations#update
#                                  PUT        /users(.:format)                                                         devise/registrations#update
#                                  DELETE     /users(.:format)                                                         devise/registrations#destroy
#                                  POST       /users(.:format)                                                         devise/registrations#create
#            new_user_confirmation GET        /users/confirmation/new(.:format)                                        devise/confirmations#new
#                user_confirmation GET        /users/confirmation(.:format)                                            devise/confirmations#show
#                                  POST       /users/confirmation(.:format)                                            devise/confirmations#create
# 

# require 'api_constraint'

Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

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
        shallow do 
          resources :categories do
            resources :sub_categories do 
              resources :products
            end
          end
        end
        post 'users/signup' => 'users#create'
        post 'users/signin' => 'sessions#create'
        post 'password/forgot', to: 'password#forgot'
        post 'password/reset', to: 'password#reset'
      end
    end
  end
  devise_for :users
end
