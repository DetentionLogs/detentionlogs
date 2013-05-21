Detentionlogs::Application.routes.draw do
  
  
  
  
  resources :location_groups


  resources :attachments


  resources :locations


  match 'subscriptions/create' => 'subscriptions#create'  
  match 'subscriptions/thankyou' => 'subscriptions#thankyou'
  
  match 'incidents/:id/deletereport' => 'incidents#deletereport'
  
  resources :subscriptions

  match 'data/incidents/' => 'incidents#index'
  match 'data/incidents/:id' => 'incidents#show', :as => :incident
  match 'data/incidents/:id/edit' => 'incidents#edit', :as => :edit_incident
  match 'data/incidents/:id/update' => 'incidents#update'
  match 'data/incidents/:id/create' => 'incidents#create'
  match 'data/incidents/:id/destroy' => 'incidents#destroy'
  match 'data/incidents/:id/adopt' => 'incidents#adopt'
  match 'data/incidents/' => 'incidents#index'
  match 'incidents/all.:format' => 'incidents#all'  

  match 'data' => redirect('data/incidents/')
  match 'incidents' => redirect('data/incidents/')
  match 'incidents/:id' => redirect('data/incidents/:id') 

  match 'populate_location_id' => 'incidents#populate_location_id'
  
  
  
  #resources :incidents


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
 
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
   root :to => 'gateway#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
