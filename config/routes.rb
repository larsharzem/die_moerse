Moerse::Application.routes.draw do

  #match ':controller(/:action(/:id(.:format)))' => 'moerse/:controller(/:action(/:id(.:format)))'
  match		"moerse/home", :as => "home"
  
  post		"bargains/accept"
  match		"moerse/bargains/accept", :as => "acceptBargain"
  post		"bargains/deny"
  match		"moerse/bargains/deny", :as => "denyBargain"
  post		"bargains/repropose"
  match		"moerse/bargains/repropose", :as => "reproposeBargain"
  get		"bargains/destroy"
  match		"moerse/bargains/destroy", :as => "bargain_destroy"
  resources	:bargains, :path => "/moerse/bargains"
  resources	:bargains

  resources	:products, :path => "/moerse/products"
  get		"products/destroy"
  match		"moerse/products/destroy", :as => "product_destroy"
  get		"products/destroy_real"
  match		"moerse/products/destroy_real", :as => "product_destroy_real"
  resources	:products
  
  get		"users/resetPassword"
  post		"users/resetPassword"
  match		"moerse/users/resetPassword", :as => "resetPassword"
  get		"users/dashboard"
  match		"moerse/users/dashboard", :as => "dashboard"
  get		"users/destroy_real"
  match		"moerse/users/destroy_real", :as => "user_destroy_real"
  get		"users/destroy"
  match		"moerse/users/destroy", :as => "user_destroy"
  resources	:users, :path => "/moerse/users"
  resources	:users
  
  get		"sessions/new"
  # match		"moerse/sessions/new", :as => "destroy_real"
  post		"sessions/create"
  # match		"moerse/sessions/create", :as => "destroy_real"
  get		"sessions/destroy"
  match		"moerse/sessions/destroy", :as => "logout"
  resources	:sessions, :path => "/moerse/sessions"
  resources	:sessions

  resources	:home, :path => "/moerse/home"
  resources	:home
  
  resources :imprint, :path => "/moerse/imprint"
  resources :imprint
  
  resources :agb, :path => "/moerse/agb"
  resources :agb

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #    'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  
end
