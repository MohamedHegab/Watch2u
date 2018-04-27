# == Route Map
#
#                            Prefix Verb       URI Pattern                                                              Controller#Action
#            new_admin_user_session GET        /admin/login(.:format)                                                   active_admin/devise/sessions#new
#                admin_user_session POST       /admin/login(.:format)                                                   active_admin/devise/sessions#create
#        destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                                  active_admin/devise/sessions#destroy
#           new_admin_user_password GET        /admin/password/new(.:format)                                            active_admin/devise/passwords#new
#          edit_admin_user_password GET        /admin/password/edit(.:format)                                           active_admin/devise/passwords#edit
#               admin_user_password PATCH      /admin/password(.:format)                                                active_admin/devise/passwords#update
#                                   PUT        /admin/password(.:format)                                                active_admin/devise/passwords#update
#                                   POST       /admin/password(.:format)                                                active_admin/devise/passwords#create
#                        admin_root GET        /admin(.:format)                                                         admin/dashboard#index
# batch_action_admin_sub_categories POST       /admin/sub_categories/batch_action(.:format)                             admin/sub_categories#batch_action
#              admin_sub_categories GET        /admin/sub_categories(.:format)                                          admin/sub_categories#index
#                                   POST       /admin/sub_categories(.:format)                                          admin/sub_categories#create
#            new_admin_sub_category GET        /admin/sub_categories/new(.:format)                                      admin/sub_categories#new
#           edit_admin_sub_category GET        /admin/sub_categories/:id/edit(.:format)                                 admin/sub_categories#edit
#                admin_sub_category GET        /admin/sub_categories/:id(.:format)                                      admin/sub_categories#show
#                                   PATCH      /admin/sub_categories/:id(.:format)                                      admin/sub_categories#update
#                                   PUT        /admin/sub_categories/:id(.:format)                                      admin/sub_categories#update
#                                   DELETE     /admin/sub_categories/:id(.:format)                                      admin/sub_categories#destroy
#     batch_action_admin_categories POST       /admin/categories/batch_action(.:format)                                 admin/categories#batch_action
#                  admin_categories GET        /admin/categories(.:format)                                              admin/categories#index
#                                   POST       /admin/categories(.:format)                                              admin/categories#create
#                new_admin_category GET        /admin/categories/new(.:format)                                          admin/categories#new
#               edit_admin_category GET        /admin/categories/:id/edit(.:format)                                     admin/categories#edit
#                    admin_category GET        /admin/categories/:id(.:format)                                          admin/categories#show
#                                   PATCH      /admin/categories/:id(.:format)                                          admin/categories#update
#                                   PUT        /admin/categories/:id(.:format)                                          admin/categories#update
#                                   DELETE     /admin/categories/:id(.:format)                                          admin/categories#destroy
#    batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                                admin/admin_users#batch_action
#                 admin_admin_users GET        /admin/admin_users(.:format)                                             admin/admin_users#index
#                                   POST       /admin/admin_users(.:format)                                             admin/admin_users#create
#              new_admin_admin_user GET        /admin/admin_users/new(.:format)                                         admin/admin_users#new
#             edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                                    admin/admin_users#edit
#                  admin_admin_user GET        /admin/admin_users/:id(.:format)                                         admin/admin_users#show
#                                   PATCH      /admin/admin_users/:id(.:format)                                         admin/admin_users#update
#                                   PUT        /admin/admin_users/:id(.:format)                                         admin/admin_users#update
#                                   DELETE     /admin/admin_users/:id(.:format)                                         admin/admin_users#destroy
#       batch_action_admin_products POST       /admin/products/batch_action(.:format)                                   admin/products#batch_action
#                    admin_products GET        /admin/products(.:format)                                                admin/products#index
#                                   POST       /admin/products(.:format)                                                admin/products#create
#                 new_admin_product GET        /admin/products/new(.:format)                                            admin/products#new
#                edit_admin_product GET        /admin/products/:id/edit(.:format)                                       admin/products#edit
#                     admin_product GET        /admin/products/:id(.:format)                                            admin/products#show
#                                   PATCH      /admin/products/:id(.:format)                                            admin/products#update
#                                   PUT        /admin/products/:id(.:format)                                            admin/products#update
#                                   DELETE     /admin/products/:id(.:format)                                            admin/products#destroy
#          batch_action_admin_users POST       /admin/users/batch_action(.:format)                                      admin/users#batch_action
#                       admin_users GET        /admin/users(.:format)                                                   admin/users#index
#                                   POST       /admin/users(.:format)                                                   admin/users#create
#                    new_admin_user GET        /admin/users/new(.:format)                                               admin/users#new
#                   edit_admin_user GET        /admin/users/:id/edit(.:format)                                          admin/users#edit
#                        admin_user GET        /admin/users/:id(.:format)                                               admin/users#show
#                                   PATCH      /admin/users/:id(.:format)                                               admin/users#update
#                                   PUT        /admin/users/:id(.:format)                                               admin/users#update
#                                   DELETE     /admin/users/:id(.:format)                                               admin/users#destroy
#         batch_action_admin_orders POST       /admin/orders/batch_action(.:format)                                     admin/orders#batch_action
#                      admin_orders GET        /admin/orders(.:format)                                                  admin/orders#index
#                                   POST       /admin/orders(.:format)                                                  admin/orders#create
#                   new_admin_order GET        /admin/orders/new(.:format)                                              admin/orders#new
#                  edit_admin_order GET        /admin/orders/:id/edit(.:format)                                         admin/orders#edit
#                       admin_order GET        /admin/orders/:id(.:format)                                              admin/orders#show
#                                   PATCH      /admin/orders/:id(.:format)                                              admin/orders#update
#                                   PUT        /admin/orders/:id(.:format)                                              admin/orders#update
#                                   DELETE     /admin/orders/:id(.:format)                                              admin/orders#destroy
#                   admin_dashboard GET        /admin/dashboard(.:format)                                               admin/dashboard#index
#                    admin_comments GET        /admin/comments(.:format)                                                admin/comments#index
#                                   POST       /admin/comments(.:format)                                                admin/comments#create
#                     admin_comment GET        /admin/comments/:id(.:format)                                            admin/comments#show
#                                   DELETE     /admin/comments/:id(.:format)                                            admin/comments#destroy
#                              root GET        /                                                                        admin/dashboard#index
#              api_v1_users_signout GET        (/:locale)/api/v1/users/signout(.:format)                                api/v1/sessions#destroy {:format=>"json", :locale=>/en|ar/}
#         create_guest_api_v1_users GET        (/:locale)/api/v1/users/create_guest(.:format)                           api/v1/users#create_guest {:format=>"json", :locale=>/en|ar/}
#                      api_v1_users POST       (/:locale)/api/v1/users(.:format)                                        api/v1/users#create {:format=>"json", :locale=>/en|ar/}
#                       api_v1_user GET        (/:locale)/api/v1/users/:id(.:format)                                    api/v1/users#show {:format=>"json", :locale=>/en|ar/}
#                                   PATCH      (/:locale)/api/v1/users/:id(.:format)                                    api/v1/users#update {:format=>"json", :locale=>/en|ar/}
#                                   PUT        (/:locale)/api/v1/users/:id(.:format)                                    api/v1/users#update {:format=>"json", :locale=>/en|ar/}
#                                   DELETE     (/:locale)/api/v1/users/:id(.:format)                                    api/v1/users#destroy {:format=>"json", :locale=>/en|ar/}
#                   api_v1_sessions POST       (/:locale)/api/v1/sessions(.:format)                                     api/v1/sessions#create {:format=>"json", :locale=>/en|ar/}
#                    api_v1_session DELETE     (/:locale)/api/v1/sessions/:id(.:format)                                 api/v1/sessions#destroy {:format=>"json", :locale=>/en|ar/}
#      api_v1_sub_category_products GET        (/:locale)/api/v1/sub_categories/:sub_category_id/products(.:format)     api/v1/products#index {:format=>"json", :locale=>/en|ar/}
#                                   POST       (/:locale)/api/v1/sub_categories/:sub_category_id/products(.:format)     api/v1/products#create {:format=>"json", :locale=>/en|ar/}
#   new_api_v1_sub_category_product GET        (/:locale)/api/v1/sub_categories/:sub_category_id/products/new(.:format) api/v1/products#new {:format=>"json", :locale=>/en|ar/}
#               edit_api_v1_product GET        (/:locale)/api/v1/products/:id/edit(.:format)                            api/v1/products#edit {:format=>"json", :locale=>/en|ar/}
#                    api_v1_product GET        (/:locale)/api/v1/products/:id(.:format)                                 api/v1/products#show {:format=>"json", :locale=>/en|ar/}
#                                   PATCH      (/:locale)/api/v1/products/:id(.:format)                                 api/v1/products#update {:format=>"json", :locale=>/en|ar/}
#                                   PUT        (/:locale)/api/v1/products/:id(.:format)                                 api/v1/products#update {:format=>"json", :locale=>/en|ar/}
#                                   DELETE     (/:locale)/api/v1/products/:id(.:format)                                 api/v1/products#destroy {:format=>"json", :locale=>/en|ar/}
#    api_v1_category_sub_categories GET        (/:locale)/api/v1/categories/:category_id/sub_categories(.:format)       api/v1/sub_categories#index {:format=>"json", :locale=>/en|ar/}
#                                   POST       (/:locale)/api/v1/categories/:category_id/sub_categories(.:format)       api/v1/sub_categories#create {:format=>"json", :locale=>/en|ar/}
#  new_api_v1_category_sub_category GET        (/:locale)/api/v1/categories/:category_id/sub_categories/new(.:format)   api/v1/sub_categories#new {:format=>"json", :locale=>/en|ar/}
#          edit_api_v1_sub_category GET        (/:locale)/api/v1/sub_categories/:id/edit(.:format)                      api/v1/sub_categories#edit {:format=>"json", :locale=>/en|ar/}
#               api_v1_sub_category GET        (/:locale)/api/v1/sub_categories/:id(.:format)                           api/v1/sub_categories#show {:format=>"json", :locale=>/en|ar/}
#                                   PATCH      (/:locale)/api/v1/sub_categories/:id(.:format)                           api/v1/sub_categories#update {:format=>"json", :locale=>/en|ar/}
#                                   PUT        (/:locale)/api/v1/sub_categories/:id(.:format)                           api/v1/sub_categories#update {:format=>"json", :locale=>/en|ar/}
#                                   DELETE     (/:locale)/api/v1/sub_categories/:id(.:format)                           api/v1/sub_categories#destroy {:format=>"json", :locale=>/en|ar/}
#                 api_v1_categories GET        (/:locale)/api/v1/categories(.:format)                                   api/v1/categories#index {:format=>"json", :locale=>/en|ar/}
#                                   POST       (/:locale)/api/v1/categories(.:format)                                   api/v1/categories#create {:format=>"json", :locale=>/en|ar/}
#               new_api_v1_category GET        (/:locale)/api/v1/categories/new(.:format)                               api/v1/categories#new {:format=>"json", :locale=>/en|ar/}
#              edit_api_v1_category GET        (/:locale)/api/v1/categories/:id/edit(.:format)                          api/v1/categories#edit {:format=>"json", :locale=>/en|ar/}
#                   api_v1_category GET        (/:locale)/api/v1/categories/:id(.:format)                               api/v1/categories#show {:format=>"json", :locale=>/en|ar/}
#                                   PATCH      (/:locale)/api/v1/categories/:id(.:format)                               api/v1/categories#update {:format=>"json", :locale=>/en|ar/}
#                                   PUT        (/:locale)/api/v1/categories/:id(.:format)                               api/v1/categories#update {:format=>"json", :locale=>/en|ar/}
#                                   DELETE     (/:locale)/api/v1/categories/:id(.:format)                               api/v1/categories#destroy {:format=>"json", :locale=>/en|ar/}
#                     api_v1_orders GET        (/:locale)/api/v1/orders(.:format)                                       api/v1/orders#index {:format=>"json", :locale=>/en|ar/}
#                                   POST       (/:locale)/api/v1/orders(.:format)                                       api/v1/orders#create {:format=>"json", :locale=>/en|ar/}
#                  new_api_v1_order GET        (/:locale)/api/v1/orders/new(.:format)                                   api/v1/orders#new {:format=>"json", :locale=>/en|ar/}
#                 edit_api_v1_order GET        (/:locale)/api/v1/orders/:id/edit(.:format)                              api/v1/orders#edit {:format=>"json", :locale=>/en|ar/}
#                      api_v1_order GET        (/:locale)/api/v1/orders/:id(.:format)                                   api/v1/orders#show {:format=>"json", :locale=>/en|ar/}
#                                   PATCH      (/:locale)/api/v1/orders/:id(.:format)                                   api/v1/orders#update {:format=>"json", :locale=>/en|ar/}
#                                   PUT        (/:locale)/api/v1/orders/:id(.:format)                                   api/v1/orders#update {:format=>"json", :locale=>/en|ar/}
#                                   DELETE     (/:locale)/api/v1/orders/:id(.:format)                                   api/v1/orders#destroy {:format=>"json", :locale=>/en|ar/}
#             api_v1_order_products POST       (/:locale)/api/v1/order_products(.:format)                               api/v1/order_products#create {:format=>"json", :locale=>/en|ar/}
#                    api_v1_regions GET        (/:locale)/api/v1/regions(.:format)                                      api/v1/regions#index {:format=>"json", :locale=>/en|ar/}
#               api_v1_users_signup POST       (/:locale)/api/v1/users/signup(.:format)                                 api/v1/users#create {:format=>"json", :locale=>/en|ar/}
#               api_v1_users_signin POST       (/:locale)/api/v1/users/signin(.:format)                                 api/v1/sessions#create {:format=>"json", :locale=>/en|ar/}
#            api_v1_password_forgot POST       (/:locale)/api/v1/password/forgot(.:format)                              api/v1/password#forgot {:format=>"json", :locale=>/en|ar/}
#             api_v1_password_reset POST       (/:locale)/api/v1/password/reset(.:format)                               api/v1/password#reset {:format=>"json", :locale=>/en|ar/}
#                  new_user_session GET        /users/sign_in(.:format)                                                 devise/sessions#new
#                      user_session POST       /users/sign_in(.:format)                                                 devise/sessions#create
#              destroy_user_session DELETE     /users/sign_out(.:format)                                                devise/sessions#destroy
#                 new_user_password GET        /users/password/new(.:format)                                            devise/passwords#new
#                edit_user_password GET        /users/password/edit(.:format)                                           devise/passwords#edit
#                     user_password PATCH      /users/password(.:format)                                                devise/passwords#update
#                                   PUT        /users/password(.:format)                                                devise/passwords#update
#                                   POST       /users/password(.:format)                                                devise/passwords#create
#          cancel_user_registration GET        /users/cancel(.:format)                                                  devise/registrations#cancel
#             new_user_registration GET        /users/sign_up(.:format)                                                 devise/registrations#new
#            edit_user_registration GET        /users/edit(.:format)                                                    devise/registrations#edit
#                 user_registration PATCH      /users(.:format)                                                         devise/registrations#update
#                                   PUT        /users(.:format)                                                         devise/registrations#update
#                                   DELETE     /users(.:format)                                                         devise/registrations#destroy
#                                   POST       /users(.:format)                                                         devise/registrations#create
#             new_user_confirmation GET        /users/confirmation/new(.:format)                                        devise/confirmations#new
#                 user_confirmation GET        /users/confirmation(.:format)                                            devise/confirmations#show
#                                   POST       /users/confirmation(.:format)                                            devise/confirmations#create
# 

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
        shallow do 
	        resources :categories do
	          resources :sub_categories do 
	            resources :products
	          end
	        end
	      end
        resources :orders
        resources :order_products, only: [:create]
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
