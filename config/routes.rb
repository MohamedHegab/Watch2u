# == Route Map
#
#                            Prefix Verb       URI Pattern                                                              Controller#Action
#                  new_user_session GET        /admin/login(.:format)                                                   active_admin/devise/sessions#new
#                      user_session POST       /admin/login(.:format)                                                   active_admin/devise/sessions#create
#              destroy_user_session DELETE|GET /admin/logout(.:format)                                                  active_admin/devise/sessions#destroy
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
#        batch_action_admin_regions POST       /admin/regions/batch_action(.:format)                                    admin/regions#batch_action
#                     admin_regions GET        /admin/regions(.:format)                                                 admin/regions#index
#                                   POST       /admin/regions(.:format)                                                 admin/regions#create
#                  new_admin_region GET        /admin/regions/new(.:format)                                             admin/regions#new
#                 edit_admin_region GET        /admin/regions/:id/edit(.:format)                                        admin/regions#edit
#                      admin_region GET        /admin/regions/:id(.:format)                                             admin/regions#show
#                                   PATCH      /admin/regions/:id(.:format)                                             admin/regions#update
#                                   PUT        /admin/regions/:id(.:format)                                             admin/regions#update
#                                   DELETE     /admin/regions/:id(.:format)                                             admin/regions#destroy
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
#                  edit_admin_order GET        /admin/orders/:id/edit(.:format)                                         admin/orders#edit
#                       admin_order GET        /admin/orders/:id(.:format)                                              admin/orders#show
#                                   PATCH      /admin/orders/:id(.:format)                                              admin/orders#update
#                                   PUT        /admin/orders/:id(.:format)                                              admin/orders#update
#                   admin_dashboard GET        /admin/dashboard(.:format)                                               admin/dashboard#index
#                    admin_comments GET        /admin/comments(.:format)                                                admin/comments#index
#                                   POST       /admin/comments(.:format)                                                admin/comments#create
#                     admin_comment GET        /admin/comments/:id(.:format)                                            admin/comments#show
#                                   DELETE     /admin/comments/:id(.:format)                                            admin/comments#destroy
#                              root GET        /                                                                        admin/dashboard#index
#              api_v1_users_signout GET        (/:locale)/api/v1/users/signout(.:format)                                api/v1/sessions#destroy {:format=>"json", :locale=>/en|ar/}
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
#                   api_v1_payments GET        (/:locale)/api/v1/payments(.:format)                                     api/v1/payments#index {:format=>"json", :locale=>/en|ar/}
#               api_v1_users_signup POST       (/:locale)/api/v1/users/signup(.:format)                                 api/v1/users#create {:format=>"json", :locale=>/en|ar/}
#               api_v1_users_signin POST       (/:locale)/api/v1/users/signin(.:format)                                 api/v1/sessions#create {:format=>"json", :locale=>/en|ar/}
#            api_v1_password_forgot POST       (/:locale)/api/v1/password/forgot(.:format)                              api/v1/password#forgot {:format=>"json", :locale=>/en|ar/}
#             api_v1_password_reset POST       (/:locale)/api/v1/password/reset(.:format)                               api/v1/password#reset {:format=>"json", :locale=>/en|ar/}
# 

Rails.application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config.merge(skip: [:confirmations, :registrations, :unlocks])

  ActiveAdmin.routes(self)
  root to: "admin/dashboard#index"

  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
        get 'users/signout' => 'sessions#destroy'
        resources :users do 
					resources :addresses
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
        resource :cart, only: [:show, :update]
        resources :regions, only: [:index]
        resources :payments, only: [:index]
        resources :shippings
				resources :addresses
        put 'order_products' => 'order_products#update'
        get 'profile' => 'users#show'
        put 'profile' => 'users#update'
        post 'users/signup' => 'users#create'
        post 'users/signin' => 'sessions#create'
        post 'password/forgot', to: 'password#forgot'
        post 'password/reset', to: 'password#reset'
      end
    end
  end
end
