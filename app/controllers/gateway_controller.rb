class GatewayController < ApplicationController
 
   
  # GET /incidents
  # GET /incidents.json
  def index
     @subscription = Subscription.new
    render :layout => false
  end
  
end