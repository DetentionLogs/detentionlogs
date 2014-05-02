Detentionlogs::Application.routes.draw do
  root :to => 'high_voltage/pages#show', :id => 'home'

  # devise_for :admins, :skip => [:registrations]

  devise_for :admins, :skip => [:registrations] do
    delete 'logout' => 'sessions#destroy', :as => :destroy_admin_session
    get 'login' => 'devise/sessions#new'
  end

  controller :sessions do
    delete 'sign_out' => :destroy
  end

  HighVoltage.route_drawer = HighVoltage::RouteDrawers::Root

  get '/investigations' => 'high_voltage/pages#show', :id => 'investigations'

  get '/investigations/recipe' => 'high_voltage/pages#show', :id => 'investigations_recipe'

  get '/principles' => 'high_voltage/pages#show', :id => 'principles'

  get '/glossary' => 'high_voltage/pages#show', :id => 'glossary'

  get '/about' => 'high_voltage/pages#show', :id => 'about'

  get '/contribute' => 'high_voltage/pages#show', :id => 'contribute'

  get '/copyright' => 'high_voltage/pages#show', :id => 'copyright'

  #resources :location_groups

  #resources :attachments

  resources :locations

  match 'data/incidents/:incident_id/deletereport' => 'incidents#deletereport'

  match 'data/incidents/incident_number/:incident_number/adopt' => 'incidents#adopt_by_incident_number'

  match 'data/incidents/incident_number/:incident_number' => 'incidents#show_by_incident_number'

  match 'data/incidents/foi_summary.:format' => 'incidents#foi_summary'

  match 'populate_location_id' => 'data/incidents#populate_location_id'

  # provides route for the 'about' incidents action.
  scope '/data' do
    resources :incidents do
      collection do
        get 'about'
      end
    end
  end

  scope :path => '/data' do
    resources :incidents do
      delete 'deletereport'
      get 'adopt'
    end
  end

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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
