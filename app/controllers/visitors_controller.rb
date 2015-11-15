class VisitorsController < ApplicationController
  def index
    @plans = Plan.all
    @subscription = Subscription.new
  end
end
