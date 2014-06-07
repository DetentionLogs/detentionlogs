Detentionlogs::Application.routes.draw do
  devise_for :admins, :skip => :registrations

  root :to => 'home#frontpage', :id => 'home'

  # controller :sessions do
  #   delete 'sign_out' => :destroy
  # end

  HighVoltage.route_drawer = HighVoltage::RouteDrawers::Root

  get '/investigations' => 'high_voltage/pages#show', :id => 'investigations'

  get '/investigations/recipe' => 'high_voltage/pages#show', :id => 'investigations_recipe'

  get '/principles' => 'high_voltage/pages#show', :id => 'principles'

  get '/glossary' => 'high_voltage/pages#show', :id => 'glossary'

  get '/about' => 'high_voltage/pages#show', :id => 'about'

  get '/contribute' => 'high_voltage/pages#show', :id => 'contribute'


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
      # Following line could help caching of incident result pagination, but
      # adds another url scheme to support going forward.
      # needs consideration
      # get 'page/:page', :action => :index, :on => :collection
    end
  end

  # at the moment there is no other data than incidents,
  # so redirect to that
  get '/data', to: redirect('/data/incidents')

  # URL /incidents is probably looking for /data/incidents
  get '/incidents', to: redirect('/data/incidents')

  # resources :incidents
end
