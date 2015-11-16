class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    subscription = Subscription.new(permitted)
    if subscription.save
      flash[:notice] = t(:subscribed, current_user_name: current_user.name, plan_name: subscription.plan.name )
    end
    redirect_to root_path
  end

  private 
  def permitted
    params.require(:subscription).permit(:plan_id, :user_id)
  end
end
