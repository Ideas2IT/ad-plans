class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    subscription = Subscription.new(permitted)
    if subscription.save
     flash[:notice] = "Thank you #{current_user.name}. Your subscription for #{subscription.plan.name} plan is successful"
    end
    redirect_to root_path
  end

  private 
  def permitted
    params.require(:subscription).permit(:plan_id, :user_id)
  end
end
