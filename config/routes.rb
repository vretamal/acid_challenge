# == Route Map
#
#     Prefix Verb   URI Pattern                        Controller#Action
#      users GET    /users(.:format)                   users#index
#            POST   /users(.:format)                   users#create
#   new_user GET    /users/new(.:format)               users#new
#  edit_user GET    /users/:id/edit(.:format)          users#edit
#       user GET    /users/:id(.:format)               users#show
#            PATCH  /users/:id(.:format)               users#update
#            PUT    /users/:id(.:format)               users#update
#            DELETE /users/:id(.:format)               users#destroy
# rest_login POST   /rest/login(.:format)              rest/login#login {:format=>:json}
#       rest POST   /rest/verify_user/:email(.:format) rest/login#verify_user {:format=>:json}
#

Rails.application.routes.draw do
  resources :users
  namespace :rest, defaults: { format: :json } do
    post '/login', to: 'login#login'
    post '/verify_user/:email', to: 'login#verify_user', constraints: { site_name: /[a-zA-Z1-9\.]+/ }
  end
end
