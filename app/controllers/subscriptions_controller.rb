class SubscriptionsController < ApplicationController

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    
    @subscription = Subscription.new(params[:subscription])

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to :back, notice: "emailtrue" }
        format.json { render json: @subscription, status: :created, location: @subscription }
      else
        format.html { redirect_to :back, notice: "emailfalse" }
      end
    end
  end
  

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_to subscriptions_url }
      format.json { head :no_content }
    end
  end
end
